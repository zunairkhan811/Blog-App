require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Journey to the moon', text: 'Hi Tom!') }
  subject { Like.create(user:, post:) }

  before { subject.save }

  it 'User should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'Post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'Likes_counter should be One after creating a like' do
    expect(post.likes_counter).to eq(1)
  end

  it 'Likes_counter should be Zero after destroying a like' do
    subject.destroy
    expect(post.likes_counter).to eq(0)
  end
end
