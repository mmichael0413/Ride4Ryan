class HomeController < ApplicationController
  def index
    @fund = Fund.find_by_id(1)
    @pledge = Pledge.new
  end

  def create
    @fund = Fund.find(params[:fund_id])
    @pledge = @fund.pledges.create(params[:pledge])
    
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
