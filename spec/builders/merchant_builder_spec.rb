require 'rails_helper'

RSpec.describe MerchantBuilder, type: :builders do
  it 'build an Merchant' do
    record = described_class.new(name: 'foo', address: '123 bar').build

    expect(record).to be_persisted
    expect(record).to eq(Merchant.first)
  end
end
