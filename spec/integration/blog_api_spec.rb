require 'swagger_helper'

describe 'Blog API' do
  path '/api/v1/users/{user_id}/user_posts' do
    get 'Retrieves posts for a user' do
      tags 'UserPosts'
      parameter name: :user_id, in: :path, type: :integer, description: 'ID of the user'
      produces 'application/json'
      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string }
                 }
               },
               required: %w[id title]
        let(:user_id) { create(:user).id }
        run_test!
      end
    end
  end

  path '/api/v1/posts/{post_id}/post_comments' do
    get 'Retrieves comments for a post' do
      tags 'PostComments'
      parameter name: :post_id, in: :path, type: :integer, description: 'ID of the post'
      produces 'application/json'
      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string }
                 }
               },
               required: %w[id text]
        let(:post_id) { create(:post).id }
        run_test!
      end
    end

    post 'Creates a comment for a post' do
      tags 'PostComments'
      parameter name: :post_id, in: :path, type: :integer, description: 'ID of the post'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }
      response '201', 'Created' do
        let(:post_id) { create(:post).id }
        let(:comment) { { text: 'This is a comment' } }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:post_id) { create(:post).id }
        let(:comment) { { text: '' } }
        run_test!
      end
    end
  end
end
