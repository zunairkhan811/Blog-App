class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_like_counters
  after_destroy :decrement_like_counters

  def increment_like_counters
    post.increment(:likes_counter).save
  end

  def decrement_like_counters
    post.decrement(:likes_counter).save
  end
end
