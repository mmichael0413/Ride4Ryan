class UserMailer < ActionMailer::Base
  default from: "lindsay@ride4ryan.com"
  
  def registration_email(pledge)
    from: "registrations@ride4ryan.com"
    @pledge = pledge
    @fund = Fund.find(pledge.fund_id)
    @day = Day.find(pledge.day_id)
    @admin = Admin.find(@fund.admin_id)
    @url  = "http://example.com/login"
    mail(:to => pledge.email_address, :subject => "Start Stretching!")
  end
  
  def donation_email(pledge)
    from: "donations@ride4ryan.com"
    @pledge = pledge
    @fund = Fund.find(pledge.fund_id)
    @day = Day.find(pledge.day_id)
    @admin = Admin.find(@fund.admin_id)
    @url  = "http://example.com/login"
    mail(:to => pledge.email_address, :subject => "You are too kind!")
  end
  
  def order_email(pledge)
    from: "new_order@ride4ryan.com"
    @pledge = pledge
    @order = Order.where(:pledge_id => pledge.id)
    @product = @order.product_id
    @fund = Fund.find(pledge.fund_id)
    @day = Day.find(pledge.day_id)
    @admin = Admin.find(@fund.admin_id)
    @url  = "http://example.com/login"
    mail(:to => @admin.email, :subject => "New Order!")
  end
end
