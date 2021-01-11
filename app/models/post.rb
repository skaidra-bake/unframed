class Post < ApplicationRecord
  belongs_to :user
  # has_one_attached :main_image
end
