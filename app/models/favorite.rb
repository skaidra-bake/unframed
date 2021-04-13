# frozen_string_literal: true

class Favorite < ApplicationRecord
  extend ActsAsFavoritor::FavoriteScopes

  belongs_to :favoritable, polymorphic: true
  belongs_to :favoritor, polymorphic: true

  after_create_commit :broadcast_like_update
  after_destroy :broadcast_like_update

  def block!
    update!(blocked: true)
  end

  private

  def broadcast_like_update
    broadcast_action_to 'likes', action: :update, target: 'like_count', partial: 'posts/likes',
                                 locals: { post: favoritable, current_user: favoritor }
    broadcast_action_to 'likes', action: :update, target: 'like_heart', partial: 'posts/likes',
                                 locals: { post: favoritable, current_user: favoritor }
  end
end
