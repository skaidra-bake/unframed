# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversations = current_user.mailbox.conversations
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.mark_as_read(current_user)
    @message = Mailboxer::Message.new
  end

  def new
    @recipients = User.all - [current_user]
  end

  def create
    participants_id = (params[:user_ids].map(&:to_i) + [current_user.id]).sort
    conversations = current_user.mailbox.conversations
    past_conversations = conversations.map do |c|
      { conversation: c, participants_id: c.participants.pluck(:id).sort }
    end

    existing_conversation = past_conversations.select { |c| c[:participants_id] == participants_id }.first

    if existing_conversation.nil?
      recipients = User.where(id: params[:user_ids])
      receipt = current_user.send_message(recipients, params[:body], '-')
      conversation = receipt.conversation
      redirect_to conversation_path(conversation)
    else
      current_user.reply_to_conversation(existing_conversation[:conversation], params[:body], nil)
      redirect_to conversation_path(existing_conversation[:conversation])
    end
  end
end
