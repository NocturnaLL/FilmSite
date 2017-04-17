class FilmsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def mine
    @films= current_user.films
  end

  def new
    @film = Film.new
    load_categories
  end

  def index
    @films = Film.all
    @random_films = Film.random_films
    @last_comments = Film.last_comments
    @best_films = Film.best_films
  end

  def show
    if current_user
      if @film.votes.where(user_id: current_user.id).any?
        @vote = @film.votes.where(user_id: current_user.id).first
      else
        @vote = @film.votes.build
      end
    end
  end

  def create
    @film = current_user.films.new(film_params)
    if @film.save
        redirect_to film_path(@film)
    else
      load_categories
      render :new
    end
  end

  def edit
    load_categories
  end

  def update
  	if @film.update(film_params)
  		   redirect_to film_path(@film)
  	 else
  	      render :edit
  	 end
  end

  def destroy
    @film.destroy
    redirect_to films_path, notice: "Film was deleted"
  end

  private

    def authorize_user!
      redirect_to root_path, notice: "Not authorized" unless @film.user_id == current_user.id
    end

    def film_params
      params.require(:film).permit(:title, :description, :category_id, :image, :video)
    end

    def set_film
      @film = Film.find(params[:id])
    end

    def load_categories
      @categories = Category.all.collect { |c| [c.title, c.id] }
    end
end
