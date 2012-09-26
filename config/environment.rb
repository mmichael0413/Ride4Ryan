# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ride4Ryan::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "app7538690@heroku.com",
  :password => "77$v1nka",
  :domain => "ride4ryan.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}