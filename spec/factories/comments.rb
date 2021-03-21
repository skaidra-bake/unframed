# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    # association :commentable
  end

  factory :comment_parent do
    user
  end
end
