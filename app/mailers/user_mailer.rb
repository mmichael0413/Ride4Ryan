class UserMailer < ActionMailer::Base
  
  def registration_email(pledge)
    @pledge = pledge
    @fund = Fund.find(pledge.fund_id)
    @day = Day.find(pledge.day_id)
    @time = @fund.fund_times(@day)
    mail(:to => pledge.email_address, :subject => "Start Stretching!", :from => "registrations@ride4ryan.com")
  end
  
  def donation_email(pledge)
    mail(:to => pledge.email_address, :subject => "You are too kind!", :from => "donations@ride4ryan.com")
  end
end
