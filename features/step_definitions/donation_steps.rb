When /^I go to the homepage$/ do
  fund = FactoryGirl.create(:fund)  
  day = FactoryGirl.create(:day)
  visit root_path
end

Then /^I should be able to see a donation form$/ do
  find("div.good_karma_button").click
  fill_in "pledge_first_name", :with => "I love Cucumber!"
end

