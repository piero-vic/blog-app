class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_posts_counter
    user.update(posts_counter: user.posts.length)
  end
end
