class PledgesController < ApplicationController
  
  def create
    @fund = Fund.find(params[:fund_id])
    @pledge = @fund.pledges.create(params[:pledge])
    redirect_to fund_path(@fund)
  end

end
