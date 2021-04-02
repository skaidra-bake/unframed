# frozen_string_literal: true

class CollectionPost < ApplicationRecord
  belongs_to :collection
  belongs_to :post
end
