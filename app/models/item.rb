class Item < ApplicationRecord
  # Relationships
  has_many :purchases, inverse_of: :item, dependent: :restrict_with_error

  # Validations
  validates :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
