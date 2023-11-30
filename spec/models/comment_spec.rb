require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:user) { User.create(name: 'Another User', photo: 'https://example.com', bio: 'Another bio.') }
  let(:post1) { Post.create(author: user, title: 'Journey to the moon', text: 'Hi Tom!') }
  subject { Comment.create(post: post1, user: user1, text: 'Hi Its Tommy!') }

  before { subject.save }

  it 'Post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'User should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'Comments_counter should be One' do
    expect(post1.comments_counter).to eq(1)
  end
  it 'Likes_counter should be One' do
    expect(post1.likes_counter).to eq(0)
  end
end
