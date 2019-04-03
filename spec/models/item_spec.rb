require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:purchases).inverse_of(:item).dependent(:restrict_with_error) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end
end
