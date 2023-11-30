class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_create :increment_user_counters
  after_destroy :decrement_user_counters

  def recent_comments(limit: 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def increment_user_counters
    author.increment!(:posts_counter)
  end

  def decrement_user_counters
    author.decrement!(:posts_counter)
  end
end
