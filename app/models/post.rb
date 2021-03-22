# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, as: :commentable, dependent: :destroy

  acts_as_favoritable
  acts_as_taggable_on :tags
  searchkick
end
