require 'rails_helper'

RSpec.describe Importer, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:purchases).inverse_of(:importer).dependent(:restrict_with_error) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:file) }
  end

  describe 'Callbacks' do
    context 'after_create :send_file_to_parse' do
      it 'calls ImporterJob' do
        importer = build(:importer)

        importer_job = double
        allow(ImporterJob).to receive(:set).with(wait: 1.minute).and_return(importer_job)
        allow(importer_job).to receive(:perform_later)

        importer.save

        expect(ImporterJob).to have_received(:set)
        expect(importer_job).to have_received(:perform_later)
      end
    end
  end

  describe 'AASM' do
    it 'when state imported! of aasm has been called, touch and update of importer has been triggered' do
      importer = build_stubbed(:importer)
      allow(importer).to receive(:touch).with(:imported_at)
      allow(importer).to receive(:update).with(gross_value: 0)

      expect(importer).to have_state(:importing).on(:status)
      expect(importer).to transition_from(:importing).to(:imported).on_event(:done).on(:status)

      expect(importer).to have_received(:touch)
      expect(importer).to have_received(:update)
    end
  end
end
