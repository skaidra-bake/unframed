# frozen_string_literal: true

# rubocop:disable Style/GuardClause
module ApplicationHelper
  def user_avatar(user, size = 200)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fill: [size, size,
                                           { gravity: 'Center' }])
    else
      'avatar.png'
    end
  end
end
# rubocop:enable Style/GuardClause
