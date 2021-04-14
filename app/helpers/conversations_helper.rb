# frozen_string_literal: true

module ConversationsHelper
  def penpal(conversation)
    conversation.participants.without(current_user)
  end

  def penpal_usernames(conversation)
    conversation.participants.without(current_user).map(&:username).join(', ')
  end
end
