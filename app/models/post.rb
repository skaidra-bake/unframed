# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, as: :commentable, dependent: :destroy

  acts_as_favoritable
  acts_as_taggable_on :tags
  searchkick

  scope :with_an_image, -> { includes(:image_attachment).where.not(active_storage_attachments: { record_id: nil }) }
  scope :order_by_newest, -> { order(created_at: :desc) }
end
