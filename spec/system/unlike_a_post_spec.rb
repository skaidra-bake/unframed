# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, description: FFaker::Lorem.sentence) }

  before :each do
    post
    login_as(user)
    user.favorite(post)
  end

  describe 'unlike button' do
    it 'enables me to unlike a post' do
      visit post_path(post)
      click_on 'Unlike'
      expect(page).to have_css '.like'
      expect(post.favoritors.count).to eq(0)
    end
  end
end
