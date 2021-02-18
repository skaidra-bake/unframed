require 'rails_helper'

RSpec.describe 'Users', type: :system do
    let(:user){ create(:user) }
    let(:user2){ create(:user)}

    before :each do
        login_as(user)
    end

    describe 'follow' do
      it "enables me to follow another user" do
        visit profile_path(user2)
        click_on 'Follow'
        sleep 5
        # expect(page).to have_content(user.username)
        expect(page).to have_content('Unfollow')
        expect(user2.followers_count).to eq(1)
      end
    end
end