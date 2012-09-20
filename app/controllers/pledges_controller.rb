class PledgesController < ApplicationController
  def new
    @day = Day.find_by_id(1)
    @fund = Fund.find(params[:fund_id])
    @pledge = @fund.pledges.build
    @order = Order.new
    
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @pledge }
    end
  end
  
  def create
    @fund = Fund.find_by_id(1)
    @pledge = @fund.pledges.create(params[:pledge])
    @timeslot = @pledge.timeslot.build
    
    respond_to do |format|
      if @pledge.save
        format.html  { redirect_to(@fund, :notice => 'Pledge was successfully created.') }
        format.json  { render :json => @pledge, :status => :created, :location => @pledge }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @pledge.errors, :status => :unprocessable_entity }
      end
    end
  end

end