# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user, password: 'password') }

  before do
    login_as(user)
  end

  describe 'post' do
    it 'enables me to make a new post' do
      visit root_path
      click_on 'Create a post'
      expect(page).to have_current_path(new_post_path)
      fill_in 'Description', with: 'Test12345'
      click_on 'Create post'
      expect(page).to have_content('Test12345')
    end
  end
end
