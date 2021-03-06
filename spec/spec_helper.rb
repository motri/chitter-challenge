ENV['RACK_ENV'] ||= 'test'
require 'simplecov'
require 'simplecov-console'
require_relative './web_helpers'
require_relative '../chitter'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require_relative '../data_mapper_setup'
require_relative '../models/user'
require 'database_cleaner'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

# Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

# Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
