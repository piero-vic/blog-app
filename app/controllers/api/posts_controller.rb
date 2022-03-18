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
end
