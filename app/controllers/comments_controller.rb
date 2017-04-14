class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_film
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def create
    @comment = @film.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @film
    else
      redirect_to @film
    end
  end

  def destroy
    @comment.destroy
    redirect_to @film, notice: "Comment was deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_user!
    redirect_to @film, notice: "Not authorized" unless @comment.user_id == current_user.id
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
