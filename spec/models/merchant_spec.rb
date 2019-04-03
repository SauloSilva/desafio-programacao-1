require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:purchases).inverse_of(:merchant).dependent(:restrict_with_error) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
  end
end
