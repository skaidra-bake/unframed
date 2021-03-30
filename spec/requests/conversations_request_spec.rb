# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Conversation', type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST/create' do
    context 'with no existing conversations' do
      it 'creates new conversation' do
        post '/conversations', params: { user_ids: [user2.id], body: 'Message to you, Ruby' }

        expect(response).to redirect_to conversation_path(Mailboxer::Conversation.last)
      end
    end

    context 'with an existing conversation' do
      let(:existing_receipt) { user.send_message(user2, 'Message to you, Ruby', '-') }

      it 'appends messages to existing conversation for the same participants' do
        existing_conversation = existing_receipt.conversation

        post '/conversations', params: { user_ids: [user2.id], body: 'Message to you, Ruby' }

        expect(response).to redirect_to conversation_path(existing_conversation)
      end
    end
  end
end
