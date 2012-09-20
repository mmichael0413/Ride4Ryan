class TimeslotsController < ApplicationController
  def new
    @timeslot = Timeslot.new
    
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @timeslot }
    end
  end
  
  def create
    @fund = Fund.find(params[:fund_id])
    @day = Day.find(params[:day_id])
    @timeslot = Timeslot.new(params[:timeslot])
    @timeslot.save
  end
  
end
