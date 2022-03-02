require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'renders the main posts page for a specific user' do
      get '/users/123/posts'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:index)
      expect(response.body).to include('User ID: 123')
    end

    it 'renders the post page' do
      get '/users/123/posts/123'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:show)
      expect(response.body).to include('User ID: 123')
      expect(response.body).to include('Post ID: 123')
    end
  end
end
