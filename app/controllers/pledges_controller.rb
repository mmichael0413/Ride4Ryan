class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @pledge }
    end
  end
  
  def create
    @fund = Fund.find(params[:fund_id])
    @pledge = @fund.pledges.create(params[:pledge])
    
    if @pledge.save
      if @pledge.period
        @pledge_kind = "Registering"
        UserMailer.registration_email(@pledge).deliver
      else
        @pledge_kind = "Donating"
      end
    end
      
    respond_to do |format|
      format.js { render :pledge_kind => @pledge_kind }
    end    
  end

end