require 'rails_helper'

RSpec.describe "Posts", type: :request do

  let(:user) { create(:user) }

  describe 'GET /new' do
    before :each do
      sign_in user
    end

    it 'renders the new page' do
      get '/posts/new'
      expect(response).to have_http_status(:success)
    end
  end
  
end
