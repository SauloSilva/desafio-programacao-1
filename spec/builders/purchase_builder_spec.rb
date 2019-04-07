require 'rails_helper'

RSpec.describe PurchaseBuilder, type: :builders do
  it 'build an Purchase' do
    record = described_class.new(
              quantity: 2,
              item: create(:item),
              purchaser: create(:purchaser),
              merchant: create(:merchant),
              importer: create(:importer)
            ).build

    expect(record).to be_persisted
    expect(record).to eq(Purchase.first)
  end
end
