class CommentsController < ApplicationController

  def index

    case
    when params[:user_id]
      @comments = Comment.where(:user_id => params[:user_id])
    when params[:artwork_id]
      @comments = Comment.where(:artwork_id => params[:artwork_id])
    else
      @comments = Comment.all
    end

    render json: @comments

  end


  def create
    @comments = Comment.new(comment_params)
    if @comment.save!
      render json: @comments
    else
      render json: @comments.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comments = Comment.find(param[:id])
    @comments.destroy
    render json: @comments
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end
