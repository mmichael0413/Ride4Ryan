class PledgesController < ApplicationController
  def create
      @idea = Idea.find(params[:idea_id])
      @bubble = @idea.bubbles.create(params[:bubble])
      redirect_to idea_path(@idea)
  end
end
