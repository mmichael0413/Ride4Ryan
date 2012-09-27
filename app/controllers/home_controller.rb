class HomeController < ApplicationController
  def index
    @fund = Fund.find_by_id(1)
    @pledge = @fund.pledges.build

    if params[:msg] == "thanks"
      @msg = "Thanks! Your transaction was successfully completed, you'll receive an email soon"
    elsif params[:msg] == "error"
      @msg = "Looks like something went wrong - please contact us at lindsay.alk@gmail.com or try again"
    end

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
