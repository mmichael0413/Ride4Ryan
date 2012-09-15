class Fund < ActiveRecord::Base
  attr_accessible :title, :headline, :content
  
  validates_presence_of :title, :headline, :content
  
  belongs_to :admin
  has_many :days
  has_many :products
  has_many :sponsors
  has_many :pledges
  has_many :timeslots
end
