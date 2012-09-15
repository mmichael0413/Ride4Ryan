class Sponsor < ActiveRecord::Base
  attr_accessible :fund_id, :link_url
  
  belongs_to :funds
end
