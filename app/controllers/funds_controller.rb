class FundsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @funds = current_admin.funds
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @funds }
    end
  end
  
  def new
    @fund = Fund.new
    
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @fund }
    end
  end
  
  def create
    @fund = Fund.new(params[:fund])
    @fund.admin_id = current_admin.id
  end
  
end