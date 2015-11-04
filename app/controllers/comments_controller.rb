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
      redirect_to picture_path({id: params[:picture_id]})
    else
      render 'new'
    end
  end




  def edit
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to picture_path({id: params[:picture_id]})
    else
      redirect_to root_path
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to picture_comment_path({id: params[:picture_id]})
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit([:body])
  end
end
