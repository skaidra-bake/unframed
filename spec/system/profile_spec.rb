# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profile', type: :system do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  context 'with current logged in user' do
    before do
      login_as(user)
    end

    it 'has a button "edit profile"' do
      visit profile_path(user)
      expect(page).to have_content('Edit profile')
      expect(page).not_to have_content('.follow')
    end

    context 'with users who do no follow the other user' do
      before do
        visit profile_path(user2)
      end

      it 'has a button "follow"' do
        expect(page).to have_content('Follow')
        expect(page).not_to have_content('Edit profile')
        expect(page).not_to have_content('.unfollow')
      end
    end

    context 'with users who follow other user' do
      before do
        visit profile_path(user2)
        click_on 'Follow'
      end

      it 'has a button "unfollow"' do
        expect(page).to have_content('Unfollow')
        expect(page).not_to have_content('Edit profile')
        expect(page).not_to have_content('.follow')
      end

      it 'can unfollow that user' do
        click_on 'Unfollow'
        sleep 2
        expect(page).to have_selector('.follow')
        expect(page).not_to have_content('Edit profile')
        expect(page).not_to have_content('.unfollow')
      end
    end

    pending 'has a friendly user id in the url'
  end
end
