class Setting < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :days, :products
end
