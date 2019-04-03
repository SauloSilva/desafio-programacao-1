class Importer < ApplicationRecord
  mount_uploader :file, FileUploader

  # Relationships
  has_many :purchases, inverse_of: :importer, dependent: :restrict_with_error

  # Validations
  validates :file, presence: true
end
