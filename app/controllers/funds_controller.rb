class FundsController < ApplicationController
  before_filter :authenticate_admin!, :except => :index
  
  def index
    @funds = current_admin.funds
    @fund = Fund.new
    
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
    
    respond_to do |format|
      if @fund.save
        format.html  { redirect_to(@fund, :notice => 'Fund was successfully created.') }
        format.json  { render :json => @fund, :status => :created, :location => @fund }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @fund.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @fund = Fund.find(params[:id])

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @fund }
    end
  end
  
  def edit
    @fund = Fund.find(params[:id])
  end
  
  def update
    @fund = Fund.find(params[:id])

    respond_to do |format|
      if @fund.update_attributes(params[:fund])
        format.html  { redirect_to(@fund, :notice => 'Fund was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @fund.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @fund = Fund.find(params[:id])
    @fund.destroy

    respond_to do |format|
      format.html { redirect_to funds_url }
      format.json { head :no_content }
    end
  end
end