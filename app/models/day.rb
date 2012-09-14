class Day < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :fund
  has_many :timeslots
end
