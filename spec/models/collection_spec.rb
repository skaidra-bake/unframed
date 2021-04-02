# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Collection, type: :model do
  let(:collection) { build(:collection) }

  it 'valid' do
    expect(collection).to be_valid
  end
end
