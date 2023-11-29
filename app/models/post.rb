class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy 
  has_many :likes, dependent: :destroy 

  after_create :increment_user_counters
  after_destroy :decrement_user_counters

  after_create :increment_comments_counter
  after_destroy :decrement_comments_counter

  after_create :increment_likes_counter
  after_destroy :decrement_likes_counter

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

  def increment_comments_counter
    update_columns(comments_counter: comments.count)
  end

  def decrement_comments_counter
    return if destroyed?

    update_columns(comments_counter: comments.count)
  end

  def increment_likes_counter
    update_columns(likes_counter: likes.count)
  end

  def decrement_likes_counter
    return if destroyed?

    update_columns(likes_counter: likes.count)
  end
end
