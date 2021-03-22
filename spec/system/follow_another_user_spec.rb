# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  describe 'follow' do
    before do
      login_as(user)
    end

    it 'enables me to follow another user' do
      visit profile_path(user2)
      click_on 'Follow'
      expect(page).to have_content('Unfollow')
      expect(user2.followers_count).to eq(1)
    end
  end

  context 'with logged out user' do
    it 'requires to ' do
      visit profile_path(user)
      expect(page).to have_link('.follow')
      click_link('Follow')
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
