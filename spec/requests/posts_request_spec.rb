# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }
  let(:user_post) { create(:post, user: user) }

  before :each do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders the new page' do
      get '/posts/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates new post' do
      post '/posts', params: { post: { description: 'This is a description' } }

      expect(response).to redirect_to posts_path
    end

    it 'fails to creates new post' do
      allow_any_instance_of(Post).to receive(:save).and_return(false)

      post '/posts', params: { post: { description: 'This is a description' } }

      expect(response).not_to redirect_to posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get post_path(user_post)

      expect(response).to have_http_status(:success)
    end
  end
end
