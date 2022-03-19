class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @posts
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @current_user = User.find(params[:user_id])
    post = Post.new(title: post_params[:title], text: post_params[:text], author_id: @current_user.id,
                    comments_counter: 0, likes_counter: 0)
    if post.valid?
      post.save
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
