class MerchantBuilder
  attr_reader :name, :address

  def initialize(name:, address:)
    @name = name
    @address = address
  end

  def build
    Merchant.where(name: name).first_or_create(address: address)
  end
end
