class Purchase < ApplicationRecord
  # Relationships
  belongs_to :merchant, inverse_of: :purchases
  belongs_to :item, inverse_of: :purchases
  belongs_to :purchaser, inverse_of: :purchases
  belongs_to :importer, inverse_of: :purchases

  # Validations
  validates :quantity, presence: true
end
