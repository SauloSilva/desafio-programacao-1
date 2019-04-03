class Merchant < ApplicationRecord
  # Relationships
  has_many :purchases, inverse_of: :merchant, dependent: :restrict_with_error

  # Validations
  validates :name, :address, presence: true
end
