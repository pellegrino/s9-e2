require 'rubygems'
require 'rspec'
require 'spork'

Spork.prefork do

  require 'highline/import'
  require 'colorize'
  require 'pathname'

  RSpec.configure do |config|
    config.color_enabled = true
  end

  RSpec::Matchers.define :be_between do |low, high|
    match do |actual|
      actual >= low && actual <= high
    end
  end

end

Spork.each_run do
  require 'gotham'
end

