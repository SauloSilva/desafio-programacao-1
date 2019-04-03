FactoryBot.define do
  factory :importer do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'example_input.tab')) }
  end
end
