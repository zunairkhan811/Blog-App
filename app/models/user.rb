class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  def recent_posts(limit: 3)
    posts.order(created_at: :desc).limit(limit)
  end

  private

  def update_posts_counter
    self.posts_counter = posts.count
  end
end
