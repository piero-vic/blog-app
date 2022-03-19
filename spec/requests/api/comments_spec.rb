require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  before do
    User.create(id: 1, name: 'Test', email: 'test@example.com', password: 'password123',
                bio: 'Hello', password_confirmation: 'password123', posts_counter: 0)
    Post.create(id: 1, author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
    Comment.create(author_id: 1, post_id: 1, text: 'This is my first comment')
    Comment.create(author_id: 1, post_id: 1, text: 'This is my second comment')
  end

  path '/api/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('list comments') do
      response(200, 'successful') do
        let(:user_id) { '1' }
        let(:post_id) { '1' }

        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string }
                 }
               },
               required: %w[id text]

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq(2)
        end
      end
    end
  end
end
