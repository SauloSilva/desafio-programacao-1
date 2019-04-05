require 'simplecov'
SimpleCov.minimum_coverage 100
SimpleCov.start 'rails' do
  minimum_coverage 100

  add_group 'Services', 'app/services'
  add_group 'Builders', 'app/builders'
  add_group 'Uploaders', 'app/uploaders'
end
