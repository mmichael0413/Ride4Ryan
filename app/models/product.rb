class Product < ActiveRecord::Base
  attr_accessible :name, :amount, :fund_id
  
  belongs_to :fund
  has_many :orders
end
