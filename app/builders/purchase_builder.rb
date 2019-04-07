class PurchaseBuilder
  attr_reader :quantity, :item, :purchaser, :merchant, :importer

  def initialize(quantity:, item:, purchaser:, merchant:, importer:)
    @quantity = quantity
    @item = item
    @purchaser = purchaser
    @merchant = merchant
    @importer = importer
  end

  def build
    Purchase.create(
      quantity: quantity,
      item_id: item.try(:id),
      purchaser_id: purchaser.try(:id),
      merchant_id: merchant.try(:id),
      importer_id: importer.try(:id)
    )
  end
end
