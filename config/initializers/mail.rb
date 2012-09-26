ActionMailer::Base.smtp_settings = {
  :user_name => "app7538690@heroku.com",
  :password => "88Sv1nka",
  :domain => "ride4ryan.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}