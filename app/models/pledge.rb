class Pledge < ActiveRecord::Base
  after_create :determine_type
  before_create :check_availability
  
  attr_accessible :first_name, :last_name, :shipping_address1, :shipping_address2, :shipping_city, :shipping_state
  attr_accessible :shipping_zipcode, :amount, :opt_out, :fund_id, :slot, :period, :day_id, :email_address

  belongs_to :fund
  belongs_to :day
  has_many :orders
  
  def check_availability
    fund = Fund.find(self.fund_id)
    day = Day.find(fund.days.first)
    period = self.period
    
    if self.period.present?
      slots_count = Pledge.where(:fund_id => fund.id, :day_id => day.id, :period => period).count
      if slots_count == day.slots_per_period
        false
      else
        if slots_count > 0
          latest_slot = Pledge.where(:fund_id => fund.id, :day_id => day.id, :period => period).order("slot DESC").map(&:slot).first
          self.slot = latest_slot + 1
          logger.debug "#{self.slot} - this is the slot"
        else
          self.slot = 1
        end
      end
    end
  end
  
  def determine_type
    #Grab all product amounts for current fund
    product_amounts = Product.where(:fund_id => self.fund_id).order("amount ASC").map(&:amount)
    product_ids = Product.where(:fund_id => self.fund_id).order("amount ASC").map(&:id)
    
    #If the pledge donates enough to get a product, and does not opt_out, and is not registering for spinning
    #then create a new order
    if self.period.present?
      self.amount = self.fund.registration_fee
      self.save
    else
      if self.amount >= product_amounts[0] && self.opt_out == false && self.period.blank?
        order = Order.new
        order.pledge_id = self.id
        
          #Check the amount from new pledge form to determine product id
          product_amounts.count.times do |p|
            if self.amount >= product_amounts[p] && self.amount < product_amounts[p + 1]
              order.product_id = product_ids[p]
            elsif self.amount >= product_amounts.last
              order.product_id = product_ids.last
            end
          end
          
        order.save
      end
    end
  end
  
  def period_time
    day = Day.find(self.day_id)
    times = self.fund.fund_times(day)
    
    return times[self.period]
  end
end