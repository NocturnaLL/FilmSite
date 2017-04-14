class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy,:show,:top_films]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
        redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

  def top_films
    @films = @category.top_films
  end

  def show

  end
  
  private

  def category_params
    params.require(:category).permit(:title, :desc)
  end

  def set_category
     @category = Category.find(params[:id])
  end
end
