# frozen_string_literal: true

module ConversationsHelper
  def penpal(conversation)
    conversation.participants.map(&:username).excluding(current_user.username).join(', ')
  end
end
