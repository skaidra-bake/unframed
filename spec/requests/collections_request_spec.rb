# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Collections', type: :request do
  let(:user) { create(:user) }
  let(:user_collection) { create(:collection, user: user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success for index' do
      get '/collections'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders the new collection form' do
      get '/collections/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates new collection' do
      post '/collections', params: { collection: { name: 'This is a name', description: 'This is a new collection' } }

      expect(response).to redirect_to collections_path
    end

    it 'fails to creates new collection' do
      allow_any_instance_of(Collection).to receive(:save).and_return(false)

      post '/collections', params: { collection: { name: 'This is a name', description: 'This is a new collection' } }

      expect(response).not_to redirect_to collections_path
    end
  end
end
