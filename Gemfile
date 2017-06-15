source 'https://rubygems.org'

ruby '2.3.1'

# gem 'airbrake'
gem 'aws-sdk', '~> 2'
gem 'bootstrap-kaminari-views'
gem 'bootstrap-sass'
gem 'bootstrap-wysihtml5-rails'
gem 'coffee-rails'
gem 'devise'
gem 'dotenv-rails'
gem 'flutie'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'friendly_id'
gem 'google-api-client', '0.8.2'
gem 'jquery-rails'
gem 'kaminari'
gem 'koala'
gem 'nested_form'
gem 'paperclip'
gem 'pg'
gem 'rails', '~> 5.0.1'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sass-rails'
gem 'simple_form'
gem 'slim-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-fancybox'
  gem 'rails-assets-jquery', '2.2.4'
  gem 'rails-assets-jquery-ujs'
end

group :development do
  gem 'better_errors'
  gem 'guard-rspec'
  gem 'pry-rails'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :staging, :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
  gem 'uglifier', '>= 1.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'poltergeist', '>= 1.4.0'
  gem 'simplecov', require: false
end
