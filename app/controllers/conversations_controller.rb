class ConversationsController < ApplicationController
    def index
        @conversations = current_user.mailbox.conversations
    end
end