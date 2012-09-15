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
    start_time = Day.where(:fund_id => fund).map(:start_time)
    return start_time
  end
  
end