class Order < ActiveRecord::Base
  attr_accessible :pledge_id, :product_id, :filled
  
  belongs_to :pledge
  belongs_to :product
end
