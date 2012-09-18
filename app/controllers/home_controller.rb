class HomeController < ApplicationController
  def index
    @fund = Fund.find_by_id(1)
  end
end
