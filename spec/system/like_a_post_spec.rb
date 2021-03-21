# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, description: FFaker::Lorem.sentence) }

  before :each do
    post
    login_as(user)
  end

  describe 'like button' do
    it 'enables me to like a post' do
      visit post_path(post)
      click_on 'Like'
      # expect(page).to have_content(user.username)
      expect(page).to have_content('Unlike')
      expect(post.favoritors.count).to eq(1)
    end
  end
end
