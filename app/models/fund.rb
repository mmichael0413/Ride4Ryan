class Fund < ActiveRecord::Base
  attr_accessible :title, :headline, :content
  
  validates_presence_of :title, :headline, :content
  
  belongs_to :admin
  has_many :days, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :sponsors, :dependent => :destroy
  has_many :pledges
  has_many :timeslots
  
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

end