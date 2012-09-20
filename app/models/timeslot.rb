class Timeslot < ActiveRecord::Base
  before_create :check_availability
  
  attr_accessible :slot, :pledge_id, :day_id, :fund_id

  belongs_to :day
  belongs_to :pledge
  belongs_to :fund
  
  def check_availability(day, period)
    #Find the next available slot within the specific time period
    latest_slot = Timeslot.where(:period => period).order("slot DESC").first.slot
    
    #Check if there are any existing timeslots for the time period and
    #save the timeslot record with the next available slot number
    if latest_slot
      if latest_slot == period * day.slots_per_period
        false #or return message stating that the time period is full
      else
        self.slot = latest_slot + 1 #again, does this need a self.save?
      end
      
    else
      self.slot = ((period * day.slots_per_period) - 10) #will this automatically set the record's slot field to this numnber?
      #or do I need to do self.save?
    end
  end
end