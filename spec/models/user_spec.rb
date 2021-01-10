require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:username) }
  end
end
