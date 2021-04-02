# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Collection, type: :model do
  let(:collection) { build(:collection) }

  it 'valid' do
    expect(collection).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:collection_posts) }
    it { is_expected.to have_many(:posts).through(:collection_posts) }
  end
end
