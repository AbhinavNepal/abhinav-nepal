require "rails_helper"
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"

RSpec.configure do |config|
  # Capybara's `all` DSL finder conflicts with RSpec's `all` matcher
  # http://stackoverflow.com/a/25903872/418602
  config.include Capybara::DSL, type: :feature

  # stubbing mail method in ApplicationMailer class to avoid nilclass errors in tests
  config.before(:example) do
    allow_any_instance_of(ApplicationMailer).to receive(:mail).and_return(true)
  end
end

# Setting the default Capyabara js driver to poltergeist instead of selenium
Capybara.javascript_driver = :poltergeist

options = {js_errors: false,
           timeout: 180,
           phantomjs_logger: StringIO.new,
           logger: nil,
           phantomjs_options: ["--load-images=no", "--ignore-ssl-errors=yes"]}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end
