require 'rspec'
require 'gotham'

RSpec.configure do |config|
  config.color_enabled = true
end

RSpec::Matchers.define :be_between do |low, high|
  match do |actual|
    actual >= low && actual <= high
  end
end
