class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_film
  before_action :set_vote, only: [:update]
  before_action :authorize_user!, only: [:update]
  def create
    #@vote = @idea.votes.new(rating: params[:vote][:rating])
    @vote = @film.votes.new
    redirect_to @film, notice: "Vote is not valid." and return if params[:vote].nil?
    @vote.rating = params[:vote][:rating]
    @vote.user = current_user
    if @vote.save
      redirect_to @film, notice: "Vote saved."
    else
      redirect_to @film, notice: "Vote is not valid."
    end
  end

 def show

 end

  def destroy
  end

  def update
    if @vote.update(rating: params[:vote][:rating])
      redirect_to @film, notice: "Vote saved."
    else
      redirect_to @film, notice: "Vote is not valid."
    end

  end
  private

  def authorize_user!
    redirect_to @film, notice: "Not authorized" unless @vote.user_id == current_user.id
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
