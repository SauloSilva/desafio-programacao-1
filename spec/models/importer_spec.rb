require 'rails_helper'

RSpec.describe Importer, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:purchases).inverse_of(:importer).dependent(:restrict_with_error) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:file) }
  end
end
