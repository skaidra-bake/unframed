# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  it 'valid' do
    expect(post).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:collection_posts) }
    it { is_expected.to have_many(:collections).through(:collection_posts) }
  end
end
