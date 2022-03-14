# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootstrap', '~> 5.1.3'
gem 'bootsnap', '>= 1.4.4', require: false
gem "cocoon"
gem "cpf_cnpj"
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'ransack', '2.4.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'pry', '~> 0.13.1'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.18', require: false
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'simple_form', '~> 5.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

