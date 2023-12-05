require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success for Posts index page' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template for posts' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end
    it 'Response Body includes correct placeholder text' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Show posts related to user ID')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template for posts' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end
    it 'Response Body includes correct placeholder text' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Show user post with specific Id')
    end
  end
end
