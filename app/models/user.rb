class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  before_save :update_posts_counter

  def update_posts_counter
    self.posts_counter = posts.count
  end

  def recent_posts(limit: 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
