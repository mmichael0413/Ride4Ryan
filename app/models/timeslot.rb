class Timeslot < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :day
  belongs_to :pledge
  belongs_to :fund
end
