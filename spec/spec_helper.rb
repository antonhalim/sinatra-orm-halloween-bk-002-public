ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate('db/migrate')
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.order = 'default'
end

def app
  Rack::Builder.parse_file('config.ru').first
end