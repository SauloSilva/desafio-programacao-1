require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:merchant).inverse_of(:purchases).required }
    it { is_expected.to belong_to(:item).inverse_of(:purchases).required }
    it { is_expected.to belong_to(:purchaser).inverse_of(:purchases).required }
    it { is_expected.to belong_to(:importer).inverse_of(:purchases).required }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0) }
  end

  describe 'Callbacks' do
    context 'before_validation :add_gross_value' do
      it 'set gross_value' do
        purchase = build(:purchase)
        real_gross_value = purchase.item.price * purchase.quantity

        expect do
          purchase.save
          purchase.reload
        end.to change(purchase, :gross_value).from(0).to(real_gross_value)
      end
    end
  end
end
