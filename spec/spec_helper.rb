require "bundler/setup"
require "gamescript_creator"
require 'rspec-html-matchers'
require 'rspec/collection_matchers'

$LOAD_PATH << File.expand_path('../lib', __FILE__)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.define_derived_metadata(:file_path => %r{spec/.*}) do |meta|
    meta[:aggregate_failures] = true
  end
  config.include RSpecHtmlMatchers
end
