require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'Check if response status was correct' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'Check if a correct template was rendered' do
      get '/users/index'
      expect(response).to render_template(:index)
    end

    it 'Check if the response body includes correct placeholder text' do
      get '/users/index'
      expect(response.body).to include("Here is a list of users")
    end
  end

  describe 'GET /show' do
    it 'Check if response status was correct' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'Check if a correct template was rendered' do
      get '/users/show'
      expect(response).to render_template(:show)
    end

    it 'Check if the response body includes correct placeholder text' do
      get '/users/show'
      expect(response.body).to include("Here is informations for the given user")
    end
  end
end
