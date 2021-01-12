FactoryBot.define do
    factory :post do
        user
        description { 'This is a description' }
    end
end