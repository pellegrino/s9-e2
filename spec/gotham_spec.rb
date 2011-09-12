require 'spec_helper'

describe Gotham do
  it "should return a version string" do
    Gotham.version.should == Gotham::VERSION
  end
end