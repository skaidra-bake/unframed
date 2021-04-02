# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:collection_users) }
    it { is_expected.to have_many(:collections).through(:collection_users) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  end
end
