source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

## ActiveRecord ##
# postgres db
gem "pg"
# Enumerated attributes
gem "enumerize"
# make ActiveRecord models support hierarchies
# `master` as https://github.com/ClosureTree/closure_tree/issues/318
gem "closure_tree", github: 'ClosureTree/closure_tree', branch: "master"
# Object-based searching
gem "ransack"
# scope & engine based paginator
gem "kaminari"

## ActiveModel ##
gem "statesman"

## Assets ##
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# icon fonts
gem "font-awesome-rails"
# Use jquery as the JavaScript library
gem "jquery-rails"
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# rails named routes as javascript helpers
gem "js-routes"

## Caching ##
# Per-request global storage
gem "request_store"

## Form generation ##
gem "simple_form"
gem "cocoon"
gem "country_select"

## Validators ##
# ReCaptcha helpers
gem "recaptcha"
# url validator
gem "validate_url"

# general ruby templating
gem "rabl"

# flexible authentication solution based on warden
# authentication
gem "devise"
# role management library
gem "rolify"

# Minimal authorisation through OO design and pure Ruby classes
gem "pundit"

group :development, :test do
  # Debugging tools (pry, awesome print, etc.)
  gem "pry"
  gem "pry-rails" # show-routes/show-models/show-middleware, etc
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # Call 'byebug' anywhere in the code to stop execution and get a debugger console

  # code analyzer and formatter
  gem 'rubocop', require: false
  # behaviour-driven development
  gem "rspec-rails"

  # Generate sample test data
  gem "faker"

  # load environment variables
  gem "dotenv-rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # fixtures replacement
  gem 'factory_bot_rails'
  # One-liners that test common Rails functionality
  gem "shoulda-matchers"
  # Strategies for cleaning databases. Used to ensure a clean state for testing.
  gem "database_cleaner"
  # Acceptance test framework for Web applications
  gem "capybara"
  # Capybara driver that runs tests on a headless WebKit browser, provided by PhantomJS
  gem "poltergeist", require: false
  # Helper that opens page automatically when testing with capybara
  gem "launchy"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
