# frozen_string_literal: true

class CollectionPost < ApplicationRecord
  belongs_to :collection, inverse_of: :collection_posts
  belongs_to :post, inverse_of: :collection_posts
end
