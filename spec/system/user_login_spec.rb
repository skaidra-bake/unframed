# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user, password: 'password') }
  describe 'login' do
    it 'enables me to login' do
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'
      click_on 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
