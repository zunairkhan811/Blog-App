require 'rails_helper'

RSpec.describe 'Users Index Page', type: :system do
  let(:user1) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  let(:user2) do
    User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from England.')
  end

  subject do
    Post.create(author: user1, title: 'Journey to the moon', text: 'Hi Tom!')
  end

  before { subject.save }

  describe 'For User 1' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_content('Number of Posts: 1')
    end
    it 'redirects to the user show page when clicked' do
      visit users_path
      click_link 'Tom'
      expect(page).to have_current_path(user_path(user1))
    end
  end

  describe 'For User 2' do
    before { user2.save }

    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Lilly')
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_content('Number of Posts: 0')
    end
    it 'redirects to the user show page when clicked' do
      visit users_path
      click_link 'Lilly'
      expect(page).to have_current_path(user_path(user2))
    end
  end
end
