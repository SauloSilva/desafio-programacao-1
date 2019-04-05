require 'rails_helper'

RSpec.describe ItemBuilder, type: :builders do
  it 'build an Item' do
    record = described_class.new(description: 'foo', price: '10').build

    expect(record).to be_persisted
    expect(record).to eq(Item.first)
  end
end
