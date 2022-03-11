class LikesController < ApplicationController
  def create
    @current_user = current_user
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    Like.create(author_id: @current_user.id, post_id: @post_id) unless liked?
  end

  private

  def liked?
    Like.find_by(author_id: @current_user.id, post_id: @post_id).present?
  end
end
