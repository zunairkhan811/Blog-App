require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  before do
    5.times do |i|
      user.posts.create(title: "Post #{i + 1}", text: "Content #{i + 1}")
    end
  end

  describe 'User Show Page' do
    before { visit user_path(user) }

    it 'shows the user profile Picture' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'shows the user username' do
      expect(page).to have_content('Tom')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of Posts: 5')
    end

    it 'shows the user bio' do
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'shows the user\'s first 3 posts' do
      (1..3).each do |i|
        expect(page).to have_content("Post #{i}")
      end
    end

    it 'shows a button to view all user posts' do
      expect(page).to have_link('See All Posts', href: user_posts_path(user))
    end

    it 'redirects to the post show page when clicking a user\'s post' do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(user, user.posts.first))
    end

    it 'redirects to the user\'s post index page when clicking See All Posts' do
      click_link 'See All Posts'
      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
