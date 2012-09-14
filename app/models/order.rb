class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :pledge
  belongs_to :product
end
