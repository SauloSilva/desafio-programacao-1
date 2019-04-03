require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:purchases).inverse_of(:purchaser).dependent(:restrict_with_error) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
