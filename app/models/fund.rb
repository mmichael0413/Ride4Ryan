class Fund < ActiveRecord::Base
  attr_accessible :title, :headline, :content, :location, :blurb, :registration_fee
  
  validates_presence_of :title, :headline, :content
  
  belongs_to :admin
  has_many :days, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :sponsors, :dependent => :destroy
  has_many :pledges
  
  #Calculate number of available time slots based on data from Day table
  def self.number_of_timeslots_available(fund)
    start_time = Day.find_by_id(fund).start_time
    return start_time.to_time
  end
  
  def total_raised
    self.pledges.sum(:amount)
  end
  
  def days_left
    (self.start_date - Date.today).to_i
  end
  
  def start_date
    self.days.order('created_at ASC').first.date
  end
  
  #Returns the periods per day
  def periods_per_day(day)
    hours_per_day = day.end_time.to_time.hour - day.start_time.to_time.hour
    periods_per_hour = 60 / day.period_length
    
    periods_per_day = hours_per_day * periods_per_hour
  end
  
  #Returns an array of registration times for a given fund's day
  def fund_times(day)    
    times = []
    
    periods_per_day(day).to_i.times do |i| 
      times[i] = (day.start_time + (i * day.period_length * 60)).to_time
    end

    return times
  end
  
  #Return an array of available timeslots
  def available_slots(day)
    slots = []
    
    fund_times(day).size.times do |i|
      existing_slots = Timeslot.where(:period => (i + 1)).map(&:slot).count
      slots[i] = day.slots_per_period - existing_slots
    end
    
    return slots
  end
  
  def times_and_slots(day)
    times_and_slots = {}
    
  end

end