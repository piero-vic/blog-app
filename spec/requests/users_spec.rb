require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'renders the main users page' do
      get '/users'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:index)
    end

    it 'renders the user page' do
      get '/users/123'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:show)
      expect(response.body).to include('User ID: 123')
    end
  end
end
