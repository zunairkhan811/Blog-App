require 'rails_helper'
RSpec.describe 'Post Show Page', type: :system do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end
  let(:post) do
    user.posts.create(title: 'Post 1', text: 'Content 1')
  end
  before do
    5.times do |i|
      user.comments.create(post:, text: "Comment #{i + 1}")
    end
    3.times do
      user.likes.create(post:)
    end
  end
  describe 'Post Show Page' do
    before { visit user_post_path(user, post) }
    it 'shows the post title' do
      expect(page).to have_content('Post 1')
    end
    it 'shows who wrote the post' do
      expect(page).to have_content('Tom')
    end
    it 'shows how many comments the post has' do
      expect(page).to have_content('Comments: 5')
    end
    it 'shows how many likes the post has' do
      expect(page).to have_content('Likes: 3')
    end
    it 'shows the post body' do
      expect(page).to have_content('Content 1')
    end
    it 'shows the username of each commentor' do
      (1..5).each do |_i|
        expect(page).to have_content('Tom')
      end
    end
    it 'shows the comment each commentor left' do
      (1..5).each do |i|
        expect(page).to have_content("Comment #{i}")
      end
    end
  end
end
