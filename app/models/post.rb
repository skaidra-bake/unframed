# frozen_string_literal: true

class Post < ApplicationRecord
  searchkick
  acts_as_favoritable
  acts_as_taggable_on :tags

  belongs_to :user
  has_one_attached :image
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :collection_posts, dependent: :destroy
  has_many :collections, through: :collection_posts

  scope :with_an_image, -> { includes(:image_attachment).where.not(active_storage_attachments: { record_id: nil }) }
  scope :order_by_newest, -> { order(created_at: :desc) }
end
