require 'rails_helper'

RSpec.describe Importers::Parser, type: :service do
  describe 'parser' do
    it 'calls builders' do
      importer = build_stubbed(:importer)
      allow(Importer).to receive(:find).with(importer.id).and_return(importer)

      content = StringIO.new("0\nJoão Silva\tR$10 off R$20 of food\t10.0\t2\t987 Fake St\tBob's Pizza")
      allow(File).to receive(:open).and_yield(content)

      instance_of_purchaser_builder = double
      allow(PurchaserBuilder).to receive(:new).with(name: "João Silva").and_return(instance_of_purchaser_builder)
      allow(instance_of_purchaser_builder).to receive(:build).and_return(Purchaser)

      instance_of_item_builder = double
      allow(ItemBuilder).to receive(:new).with(description: 'R$10 off R$20 of food', price: '10.0').and_return(instance_of_item_builder)
      allow(instance_of_item_builder).to receive(:build).and_return(Item)

      instance_of_merchant_builder = double
      allow(MerchantBuilder).to receive(:new).with(name: "Bob's Pizza", address: '987 Fake St').and_return(instance_of_merchant_builder)
      allow(instance_of_merchant_builder).to receive(:build).and_return(Merchant)

      instance_of_purchase_builder = double
      allow(PurchaseBuilder).to receive(:new).with(quantity: '2', item: Item, purchaser: Purchaser, merchant: Merchant, importer: importer).and_return(instance_of_purchase_builder)
      allow(instance_of_purchase_builder).to receive(:build)

      described_class.new(importer.id).parser

      expect(PurchaserBuilder).to have_received(:new).with(name: "João Silva")
      expect(instance_of_purchaser_builder).to have_received(:build)

      expect(ItemBuilder).to have_received(:new).with(description: 'R$10 off R$20 of food', price: '10.0')
      expect(instance_of_item_builder).to have_received(:build)

      expect(MerchantBuilder).to have_received(:new).with(name: "Bob's Pizza", address: '987 Fake St')
      expect(instance_of_merchant_builder).to have_received(:build)

      expect(PurchaseBuilder).to have_received(:new).with(quantity: '2', item: Item, purchaser: Purchaser, merchant: Merchant, importer: importer)
      expect(instance_of_purchase_builder).to have_received(:build)
    end
  end
end
