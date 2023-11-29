class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_comment_counters
  after_destroy :decrement_comment_counters

  def increment_comment_counters
    post.increment(:comments_counter).save
  end

  def decrement_comment_counters
    post.decrement(:comments_counter).save
  end
end
