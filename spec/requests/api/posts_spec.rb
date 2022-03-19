require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  before do
    User.create(id: 1, name: 'Test', email: 'test@example.com', password: 'password123',
                bio: 'Hello', password_confirmation: 'password123', posts_counter: 0)
  end
  path '/api/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    get('list posts') do
      before do
        Post.create(id: 1, author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
                    likes_counter: 0)
        Post.create(id: 2, author_id: 1, title: 'Hello 2', text: 'This is my second post', comments_counter: 0,
                    likes_counter: 0)
      end
      response(200, 'successful') do
        let(:user_id) { '1' }
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   text: { type: :string },
                   comments_counter: { type: :integer },
                   likes_counter: { type: :integer }
                 }
               },
               required: %w[id title text comments_counter likes_counter]

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq(2)
        end
      end
    end
  end

  # path '/api/users/{user_id}/posts' do
  #   post('create post') do
  #     parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
  #     consumes 'application/json'
  #     parameter name: :blog_post, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #             title: { type: :string },
  #             text: { type: :string }
  #       },
  #       required: %w[title text]
  #     }
  #     response '200', 'Success!' do
  #       let(:user_id) { '1' }
  #       let(:blog_post) { {title: 'foo', text: 'bar'} }
  #       run_test!

  #       # do |response|
  #       #   data = JSON.parse(response.body)
  #       #   expect(data['message']).to eq('Success!')
  #       # end
  #     end
  #   end
  # end

  path '/api/users/{user_id}/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show post') do
      response(200, 'successful') do
        let(:user_id) { '1' }
        let(:id) { '1' }
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comments_counter: { type: :integer },
                 likes_counter: { type: :integer }
               },
               required: %w[id title text comments_counter likes_counter]
        let(:id) do
          Post.create(author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
                      likes_counter: 0).id
        end
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['title']).to eq('Hello 1')
        end
      end
    end
  end
end
