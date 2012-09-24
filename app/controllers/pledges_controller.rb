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
    
    if @pledge.period
      @pledge_kind = "Registering"
    else
      @pledge_kind = "Donating"
    
    respond_to do |format|
      if @pledge.save
        # Tell the UserMailer to send a registration email after save
        UserMailer.registration_email(@pledge).deliver
        
        format.html  { redirect_to(@fund, :notice => 'Pledge was successfully created.') }
        format.json  { render :json => @pledge, :status => :created, :location => @pledge }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @pledge.errors, :status => :unprocessable_entity }
      end
    end
    respond_to do |format|
      format.js { render :pledge_kind => @pledge_kind }
    end    
  end

end
