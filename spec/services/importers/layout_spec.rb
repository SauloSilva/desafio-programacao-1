require 'rails_helper'

RSpec.describe Importers::Layout, type: :service do
  describe '.pattern' do
    it 'return hash' do
      expect(described_class.pattern).to eq(
        {
          purchaser_name: 0,
          item_description: 1,
          item_price: 2,
          purchase_count: 3,
          merchant_address: 4,
          merchant_name: 5
        }
      )
    end
  end
end
