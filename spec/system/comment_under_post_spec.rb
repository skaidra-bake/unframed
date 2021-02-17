require 'rails_helper'

RSpec.describe 'Users', type: :system do
    let(:user){ create(:user, password: 'password') }
    let(:post){ create(:post, description: FFaker::Lorem.sentence)}

    before :each do
        post
        login_as(user)
    end

    describe 'comment' do
      it "enables me to make a comment" do
        visit posts_path
        click_on 'Show'
        find_field(comment[body])
        comment = FFaker::Lorem.sentence
        fill_in comment
        click_on 'Create Comment'
        expect(page).to have_content(user.username)
        expect(page).to have_content(comment)
      end
    end
  end