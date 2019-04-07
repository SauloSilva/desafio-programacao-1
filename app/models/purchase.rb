class Purchase < ApplicationRecord
  # Relationships
  belongs_to :merchant, inverse_of: :purchases, required: true
  belongs_to :item, inverse_of: :purchases, required: true
  belongs_to :purchaser, inverse_of: :purchases, required: true
  belongs_to :importer, inverse_of: :purchases, required: true

  # Validations
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  # Callbacks
  before_validation :add_gross_value

  private

  def add_gross_value
    return if item.blank?
    self.gross_value = item.price.to_f * quantity.to_i
  end
end
