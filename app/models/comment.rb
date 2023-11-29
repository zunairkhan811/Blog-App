class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_counters
  after_destroy :decrement_post_counters

  def increment_post_counters
    post.increment(:comments_counter).save
  end

  def decrement_post_counters
    post.decrement(:comments_counter).save
  end
end
