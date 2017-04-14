class CategoriesController < ApplicationController
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
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

  def show
   @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :desc)
  end
end
