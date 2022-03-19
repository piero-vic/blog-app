require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  before do
    User.create(id: 1, name: 'Test', email: 'test@example.com', password: 'password123',
                bio: 'Hello', password_confirmation: 'password123', posts_counter: 0)
    User.create(id: 2, name: 'Test 2', email: 'test2@example.com', password: 'password123',
                bio: 'Hello 2', password_confirmation: 'password123', posts_counter: 0)
  end

  path '/api/users' do
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
end
