# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :collection_posts, dependent: :destroy
  has_many :posts, through: :collection_posts
  has_many :collection_users, dependent: :destroy
  has_many :users, through: :collection_users
end
