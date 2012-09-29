class Pledge < ActiveRecord::Base
  after_create :determine_type
  before_create :check_availability
  
  attr_accessible :first_name, :last_name, :shipping_address1, :shipping_address2, :shipping_city, :shipping_state
  attr_accessible :shipping_zipcode, :amount, :opt_out, :fund_id, :slot, :period, :day_id, :email_address, :stripe_card_token

  attr_accessor :stripe_card_token

  belongs_to :fund
  belongs_to :day
  has_many :orders

  def save_with_payment
    if self.day
      msg = "#{self.email_address} registered"
    else
      msg = "#{self.email_address} donated"
    end
    
    Stripe::Charge.create(description: msg, currency: "usd", amount: (self.amount * 100), card: stripe_card_token)
    
  rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end
  
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
        else
          self.slot = 1
        end
      end
    end
  end
  
  def determine_type
    #Grab all product amounts for current fund
    products = self.fund.products.order("amount DESC").collect{|p| [p.id, p.amount]}
    
    #If the pledge donates enough to get a product, and does not opt_out, and is not registering for spinning
    #then create a new order
    if self.period.present?
      self.amount = self.fund.registration_fee
      self.save
      
      UserMailer.registration_email(self).deliver
    else
      if self.amount >= products.last[1] && self.opt_out == false && self.period.blank?
        order = Order.new
        order.pledge_id = self.id
        
          #Check the amount from new pledge form to determine the order's product id
          products.each_with_index do |p, index|
            if self.amount > p[index][1] && p[index][1].present?
              order.product_id = p[index][0]
            end
          end
          
        order.save
        
        UserMailer.donation_email(self).deliver
      end
    end
  end
  
  def period_time
    day = Day.find(self.day_id)
    times = self.fund.fund_times(day)
    
    return times[self.period]
  end
end
