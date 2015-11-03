class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @user = current_user
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to('/')
    else
      render 'new'
    end
  end

  def show
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit([:body])
  end
end
