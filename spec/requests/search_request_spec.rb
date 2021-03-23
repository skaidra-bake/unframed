# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search', type: :request do
  let(:post) { create(:post, description: 'Awesome post') }
  let(:post2) { create(:post, description: 'Another post') }

  describe 'GET /search' do
    it 'searches' do
      post '/search', params: { q: 'Awesome' }

      expect(response).to have_http_status(:success)
    end
  end
end
