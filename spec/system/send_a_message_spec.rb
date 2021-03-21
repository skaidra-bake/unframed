# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  before :each do
    login_as(user)
    user2
  end

  describe 'message' do
    it 'enables me to send a message' do
      visit new_conversation_path
      select user2.username
      fill_in 'subject', with: 'Test12345'
      fill_in 'body', with: 'Body12345'
      click_on 'Save changes'
      sleep 5
      expect(page).to have_content('Test12345')
      expect(page).to have_content('Body12345')
      expect(page).to have_content(user2.username)
    end
  end
end
