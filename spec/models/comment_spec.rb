# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#comment' do
    subject { comment.comments }

    let(:comment) { create(:comment) }

    it 'gets children / nested comment' do
      # pp subject
    end
  end
end
