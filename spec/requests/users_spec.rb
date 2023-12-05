require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /Index' do
    it 'returns http success for Users index page' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template for users' do
      get '/users'
      expect(response).to render_template(:index)
    end
    it 'Response Body includes correct placeholder text' do
      get '/users'
      expect(response.body).to include('This page shows the users list')
    end
  end

  describe 'GET /show' do
    it 'returns http success for users show page' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template for users' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end
    it 'Response Body includes correct placeholder text' do
      get '/users/:id'
      expect(response.body).to include('Show Users with Id')
    end
  end
end
