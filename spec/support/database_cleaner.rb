RSpec.configure do |config|
  # tables that should not be removed before/after tests run
  tables = []

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: tables)
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation, {except: tables}
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
