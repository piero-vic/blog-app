class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update(likes_counter: post.likes.length)
  end
end
