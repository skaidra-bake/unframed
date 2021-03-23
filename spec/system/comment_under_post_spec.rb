# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user, password: 'password') }
  let(:post) { create(:post, description: FFaker::Lorem.sentence) }
  let(:comment) { FFaker::Lorem.sentence }

  before do
    post
    login_as(user)
  end

  describe 'comment' do
    it 'enables me to make a comment' do
      visit post_path(post)
      fill_in 'comment_body', with: comment
      click_on 'Post Comment'
      expect(page).to have_content(comment)
    end
  end
end
