class ItemBuilder
  attr_reader :description, :price

  def initialize(description:, price:)
    @description = description
    @price = price
  end

  def build
    Item.where(description: description).first_or_create(price: price)
  end
end
