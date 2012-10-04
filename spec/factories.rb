# This will guess the Fund class
FactoryGirl.define do

  factory :fund do
    id 1
    headline "This is cheese"
    title "You want it?"
    admin_id 1
    location "a place"
    blurb "yerb"
    registration_fee 25
    content  "Ride4Ryan"
  end

  factory :day do
    date "2012-12-22"
    start_time "10:00"
    end_time "12:00"
    period_length 10
    slots_per_period 10
    fund_id 1
  end

end
