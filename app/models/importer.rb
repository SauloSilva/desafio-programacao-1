class Importer < ApplicationRecord
  include AASM
  mount_uploader :file, FileUploader

  # Relationships
  has_many :purchases, inverse_of: :importer, dependent: :restrict_with_error

  # Validations
  validates :file, presence: true

  # Callbacks
  after_create :send_file_to_parse, on: :create

  # State machine
  aasm(:status) do
    state :importing, initial: true
    state :imported, :cleaning

    event :done do
      transitions from: :importing, to: :imported, after: [:add_imported_at, :calculate_gross_value!]
    end
  end

  private

  def add_imported_at
    touch(:imported_at)
  end

  def calculate_gross_value!
    purchase_gross_value_sum = purchases.sum(:gross_value)
    update(gross_value: purchase_gross_value_sum)
  end

  def send_file_to_parse
    ImporterJob.set(wait: 1.minute).perform_later(id)
  end
end
