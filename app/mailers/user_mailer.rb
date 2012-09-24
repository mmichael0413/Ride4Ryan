class UserMailer < ActionMailer::Base
  default from: "lindsay@ride4ryan.com"
  
  def registration_email(pledge)
    @pledge = pledge
    @fund = Fund.find(pledge.fund_id)
    @day = Day.find(pledge.day_id)
    @admin = Admin.find(@fund.admin_id)
    @url  = "http://example.com/login"
    mail(:to => pledge.email_address, :subject => "Successful Spin-A-Thon Registration!")
  end
end
