require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe FileUploader do
  include CarrierWave::Test::Matchers

  let!(:importer) { build_stubbed(:importer) }
  let(:file) { File.open "#{Rails.root}/spec/fixtures/example_input.tab" }

  let(:uploader) do
    FileUploader.new(importer).tap do |u|
      u.store!(file)
    end
  end

  before { allow(importer).to receive(:id) { 7 } }
  after do
    uploader.remove!
    file.close
  end

  describe 'attachments' do
    it 'does upload to attachments folder' do
      expect(uploader.path).to include('uploads/importer/7/example_input.tab')
    end
  end
end
