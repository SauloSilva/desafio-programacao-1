require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:merchant).inverse_of(:purchases) }
    it { is_expected.to belong_to(:item).inverse_of(:purchases) }
    it { is_expected.to belong_to(:purchaser).inverse_of(:purchases) }
    it { is_expected.to belong_to(:importer).inverse_of(:purchases) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
