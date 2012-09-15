class Day < ActiveRecord::Base
  attr_accessible :date, :start_time, :end_time, :period_length, :slots_per_period, :fund_id

  belongs_to :fund
  has_many :timeslots
end
