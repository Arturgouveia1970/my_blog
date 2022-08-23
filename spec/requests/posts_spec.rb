require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Check if response status was correct' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'Check if a correct template was rendered' do
      get '/posts/index'
      expect(response).to render_template(:index)
    end

    it 'Check if the response body includes correct placeholder text' do
      get '/posts/index'
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'Check if response status was correct' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'Check if a correct template was rendered' do
      get '/posts/show'
      expect(response).to render_template(:show)
    end

    it 'Check if the response body includes correct placeholder text' do
      get '/posts/show'
      expect(response.body).to include('Here is single a post of the given user')
    end
  end
end
