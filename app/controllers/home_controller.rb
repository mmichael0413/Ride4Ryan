class HomeController < ApplicationController
  def index
    @fund = Fund.find_by_id(1)
    @pledge = Pledge.new
  end
end
