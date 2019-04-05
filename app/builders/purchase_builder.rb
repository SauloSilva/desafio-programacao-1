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
      item: item,
      purchaser: purchaser,
      merchant: merchant,
      importer: importer
    )
  end
end
