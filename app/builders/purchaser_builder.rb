class PurchaserBuilder
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def build
    Purchaser.where(name: name).first_or_create
  end
end
