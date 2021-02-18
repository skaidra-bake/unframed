require 'rails_helper'

RSpec.describe 'Users', type: :system do
    let(:user){ create(:user) }
    let(:user2){ create(:user)}

    before :each do
        login_as(user)
        user.follow(user2)
    end

    describe 'unfollow' do
      it "enables me to unfollow another user" do
        visit profile_path(user2)
        click_on 'Unfollow'
        sleep 4
        expect(page).to have_css('.follow')
        expect(user2.followers_count).to eq(0)
      end
    end
end