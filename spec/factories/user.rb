FactoryBot.define do
    factory :user do
        email { FFaker::Internet.email } 
        username { FFaker::Internet.user_name }
        password  { "password" }
        password_confirmation { 'password' }
    end
end