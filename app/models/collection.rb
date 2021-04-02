# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :collection_posts, dependent: :destroy
  has_many :posts, through: :collection_posts
end
