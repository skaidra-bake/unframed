# frozen_string_literal: true

class CollectionUser < ApplicationRecord
  belongs_to :collection, inverse_of: :collection_users
  belongs_to :user, inverse_of: :collection_users
end
