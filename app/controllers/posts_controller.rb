class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @current_user = current_user
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find(params[:id])
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @current_user = current_user
    post = Post.new(post_params.merge(author_id: @current_user.id, comments_counter: 0, likes_counter: 0))
    if post.valid?
      post.save
      redirect_to user_path(@current_user.id), success: 'Post published'
    else
      redirect_to new_user_post_path(@current_user.id), alert: post.errors.full_messages
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
