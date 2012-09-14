class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :fund
  has_many :orders
end
