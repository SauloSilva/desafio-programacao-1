require 'rails_helper'

RSpec.describe PurchaseBuilder, type: :builders do
  it 'build an Purchase' do
    record = described_class.new(
              quantity: 2,
              item: build_stubbed(:item),
              purchaser: build_stubbed(:purchaser),
              merchant: build_stubbed(:merchant),
              importer: build_stubbed(:importer)
            ).build

    expect(record).to be_persisted
    expect(record).to eq(Purchase.first)
  end
end
