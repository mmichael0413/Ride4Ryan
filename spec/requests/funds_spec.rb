require 'spec_helper'

describe "Funds" do
  before  do
    @fund = Fund.new(
      :title => "Ride4Ryan",
      :headline => "This cannot be cheese",
      :content => "This is the content",
      :admin_id => 1,
      :location => "Brookline",
      :blurb => "Aww yiss",
      :registration_fee => 25
      )
      
    @pledge = Pledge.new(:amount => 25)
  end
  
  it "has a title" do
    @fund.title.should == "Ride4Ryan"
  end
  
  it "shows total raised" do
    @fund.total_raised.should == 25
  end
end