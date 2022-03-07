class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update(comments_counter: post.comments.length)
  end
end
