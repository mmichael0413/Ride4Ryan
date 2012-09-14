class Sponsor < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :funds
end
