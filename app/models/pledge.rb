class Pledge < ActiveRecord::Base
  after_create :determine_type
  
  attr_accessible :first_name, :last_name, :shipping_address1, :shipping_address2, :shipping_city, :shipping_state
  attr_accessible :shipping_zipcode, :amount, :opt_out, :fund_id, :slot, :period

  belongs_to :fund
  has_many :orders
  
  def determine_type
    #If the pledge donates at least $30, and does not opt_out, and is not registering for spinning
    #then create a new order
    if self.timeslot
      self.amount = self.fund.registration_fee
    else
      if self.amount > 29 && self.opt_out == false && self.timeslot.blank?
        order = Order.new
        order.pledge_id = self.id
        
          #Check the amount from new pledge form to determine product id
          if self.amount < 50
            order.product_id = 1
          elsif self.amount < 100
            order.product_id = 2
          else
            order.product_id = 3
          end
          
        order.save
      end
    end
  end
end