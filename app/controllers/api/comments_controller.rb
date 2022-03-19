class Api::CommentsController < ApplicationController
  def create
    @current_user = User.find(1)
    @post_id = params[:post_id]
    comment = Comment.new(text: comment_params[:text], author_id: @current_user.id, post_id: @post_id)
    if comment.valid?
      comment.save
      respond_to do |format|
        msg = { status: 'ok', message: 'Success!' }
        format.json { render json: msg } # don't do msg.to_json
      end
    else
      respond_to do |format|
        msg = { status: 'fail', message: 'Failed!' }
        format.json { render json: msg } # don't do msg.to_json
      end
    end
  end

  def index
    @post_id = params[:post_id]
    render json: Post.find(@post_id).comments
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
