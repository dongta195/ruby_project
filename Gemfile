source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.0"

# ORM
gem "mysql2", ">= 0.3.18", "< 0.5"

# Common
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"

# Frontend
gem "bootstrap-sass", "~> 3.3.6"
gem "font-awesome-rails"
gem "simple-line-icons-rails", "~> 0.1.2"

# Authentication
gem "devise"

# NULL if attribute empty
gem "nilify_blanks"

# Upload file
gem "carrierwave"
gem "mini_magick"

# Support
gem "config"
gem "geocoder", "~> 1.4", ">= 1.4.4"

# Sever for rails application
gem "puma", "~> 3.7"

# Set environment variables when deploy
gem "dotenv"
gem "dotenv-deployment", require: "dotenv/deployment"

# Rails 5 require
gem "listen", "~> 3.0.5"

group :development, :test do
  # Debug
  gem "pry-rails"
  # Fake data
  gem "faker"
end

group :development do
  # Check convention
  gem "rubocop", "~> 0.40.0", require: false
  gem "brakeman"
  gem "bundler-audit", "~> 0.4.0"
  gem "listen", "~> 3.0.5"
  gem "awesome_print"
  gem "hirb"
  # deployment
  gem "capistrano",         require: false
  gem "capistrano-rvm",     require: false
  gem "capistrano-rails",   require: false
  gem "capistrano-bundler", require: false
  gem "capistrano3-puma",   require: false
end

group :test do
  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", "~> 4.0"
  gem "shoulda-matchers", "~> 3.0"
  gem "database_cleaner", "~> 1.5"
  gem "simplecov", require: false
end
