module Importers
  class Parser
    attr_reader :importer, :layout

    def initialize(importer_id)
      @importer = Importer.find(importer_id)
      @layout = Importers::Layout.pattern
    end

    def parser
      read_lines do |line, i|
        next if i == 0
        parse_line(line)
      end
    end

    private

    def parse_line(line)
      attributes = line.split("\t")

      purchaser = purchaser_builder(attributes)
      item = item_builder(attributes)
      merchant = merchant_builder(attributes)

      purchase_builder(attributes, item, purchaser, merchant, importer)
    end

    def purchaser_builder(attributes)
      name = attributes[layout[:purchaser_name]]

      PurchaserBuilder.new(name: name).build
    end

    def item_builder(attributes)
      description = attributes[layout[:item_description]]
      price = attributes[layout[:item_price]]

      ItemBuilder.new(description: description, price: price).build
    end

    def merchant_builder(attributes)
      address = attributes[layout[:merchant_address]]
      name = attributes[layout[:merchant_name]]

      MerchantBuilder.new(name: name, address: address).build
    end

    def purchase_builder(attributes, item, purchaser, merchant, importer)
      quantity = attributes[layout[:purchase_count]]

      PurchaseBuilder.new(quantity: quantity, item: item, purchaser: purchaser, merchant: merchant, importer: importer).build
    end

    def read_lines
      File.open(importer.file.path, "r") do |f|
        f.each_line.with_index do |line, i|
          yield line, i
        end
      end
    end
  end
end
