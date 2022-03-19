require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/api/users' do
    before do
      User.create(id: 1, name: 'Test', email: 'test@example.com', password: 'password123',
                  bio: 'Hello', password_confirmation: 'password123', posts_counter: 0)
      User.create(id: 2, name: 'Test 2', email: 'test2@example.com', password: 'password123',
                  bio: 'Hello 2', password_confirmation: 'password123', posts_counter: 0)
    end
    get('list users') do
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   email: { type: :string },
                   bio: { type: :string },
                   posts_counter: { type: :integer }
                 }
               },
               required: %w[id name email bio posts_counter]

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq(2)
        end
      end
    end
  end

  path '/api/users/{id}' do
    get('show user') do
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 email: { type: :string },
                 bio: { type: :string },
                 posts_counter: { type: :integer }
               },
               required: %w[id name email bio posts_counter]
        let(:id) do
          User.create(name: 'Test 5', email: 'test5@example.com', password: 'password123',
                      bio: 'Hello', password_confirmation: 'password123', posts_counter: 0).id
        end
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['name']).to eq('Test 5')
        end
      end
    end
  end
end
