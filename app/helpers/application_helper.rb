module ApplicationHelper

    def user_avatar(user, size=200)
        if user.avatar.attached?
            user.avatar.variant(resize_to_fill: [size, size, gravity: 'Center'])
        end
    end

end
