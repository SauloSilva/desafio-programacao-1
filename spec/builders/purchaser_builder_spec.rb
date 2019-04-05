require 'rails_helper'

RSpec.describe PurchaserBuilder, type: :builders do
  it 'build an Purchaser' do
    record = described_class.new(name: 'foo').build

    expect(record).to be_persisted
    expect(record).to eq(Purchaser.first)
  end
end
