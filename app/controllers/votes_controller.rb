class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_film

  def create
    #@vote = @idea.votes.new(rating: params[:vote][:rating])
  end

  def destroy
  end

  private

  def set_idea
    @film = Film.find(params[:film_id])
  end
end
