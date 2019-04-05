module Importers
  class Layout
    def self.pattern
      {
        purchaser_name: 0,
        item_description: 1,
        item_price: 2,
        purchase_count: 3,
        merchant_address: 4,
        merchant_name: 5
      }
    end
  end
end
