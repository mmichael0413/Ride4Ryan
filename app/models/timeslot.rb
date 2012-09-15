class Timeslot < ActiveRecord::Base
  attr_accessible :slot, :pledge_id, :day_id, :fund_id

  belongs_to :day
  belongs_to :pledge
  belongs_to :fund
end
