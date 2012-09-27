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
    @pledge = @fund.pledges.build(params[:pledge])
    
    if @pledge.save
      if @pledge.period
        @pledge_kind = "Registering"
      else
        @pledge_kind = "Donating"
      end
    end

    if @pledge.save_with_payment
      msg = "thanks"
    else
      msg = "error"
    end

    redirect_to :controller => 'home', :action => 'index', :msg => msg    

  end

end
