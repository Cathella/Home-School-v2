source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'


# Begin custom gems
gem 'friendly_id'
# End custom gems

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1', '>= 6.1.4'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Add webpacker
gem 'webpacker', '~> 5.2', '>= 5.2.1'
# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

gem "aws-sdk-s3", require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'fuubar'
  gem 'guard'
  gem 'guard-rspec'
  gem 'listen', '~> 3.5', '>= 3.5.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'figaro'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem "rubocop"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
end

group :test do
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise', '~> 4.8'

gem 'binding_of_caller', '~> 1.0'
gem 'geocoder', '~> 1.6', '>= 1.6.7'
gem 'ransack', '~> 2.4', '>= 2.4.2'
gem 'local_time', '~> 2.1'
gem 'google-cloud-storage'
