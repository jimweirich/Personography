#!/usr/bin/ruby -wKU

source 'http://rubygems.org'

gem 'heroku'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'rails', '3.1.0'

# gem 'sqlite3'
gem 'mysql2', '>= 0.3'
gem 'basic_assumption'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'pg'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'pry', :require => false
  gem 'machinist', '= 2.0.0.beta2'
  gem 'webrat'
  gem 'rspec', '~> 2.5'
  gem 'rspec-rails', '~> 2.5'
  gem 'rspec-given'
  gem 'flexmock'
end
