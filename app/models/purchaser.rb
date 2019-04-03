class Purchaser < ApplicationRecord
  # Relationships
  has_many :purchases, inverse_of: :purchaser, dependent: :restrict_with_error

  # Validations
  validates :name, presence: true
end
