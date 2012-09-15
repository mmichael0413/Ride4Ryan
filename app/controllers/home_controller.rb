class HomeController < ApplicationController
  def index
    redirect_to funds_path
  end
end
