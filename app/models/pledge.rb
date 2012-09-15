class Pledge < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :shipping_address1, :shipping_address2, :shipping_city, :shipping_state
  attr_accessible :shipping_zipcode, :amount, :opt_out, :fund_id

  belongs_to :fund
  has_many :orders
  has_many :timeslots
end
