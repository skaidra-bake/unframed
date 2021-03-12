require 'rails_helper'

RSpec.describe 'Profile', type: :system do
    let(:user){ create(:user) }
    let(:user2){ create(:user) }

    context 'with current logged in user' do
        before :each do
            login_as(user)
        end

        it 'has a button "edit profile"' do
            visit profile_path(user)
            expect(page).to have_content('Edit profile')
            expect(page).not_to have_content('.follow')
        end

        it 'has a button "follow"' do
            visit profile_path(user2)
            expect(page).to have_content('Follow')
            expect(page).not_to have_content('Edit profile')
        end
    end
end