class Pledge < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :fund
  has_many :orders
  has_many :timeslots
end
