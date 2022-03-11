class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    comment = Comment.new(comment_params.merge(author_id: @current_user.id, post_id: @post_id))
    if comment.save
      redirect_to user_post_path(@user_id, @post_id), success: 'Comment published'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
