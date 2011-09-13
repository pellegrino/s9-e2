require 'spec_helper'
describe Gotham::Region do
  describe "#new" do
    it "should initialize with just name parameter" do
      region = Gotham::Region.new("testing")

      region.name.should == "testing"
    end

    it "should always have a block hash" do
      region = sample_region

      region.blocks.should be_a(Hash)
      region.blocks.should have(10).blocks
    end

    it "should add a random path between 0 and another block" do
      region  = sample_region
      path_to = region.blocks[0].paths[0]

      path_to.should be_between(0, 9)
      region.blocks.should have_key(0)
      region.blocks[0].should have(1).paths
      region.blocks[path_to].paths.should include(0)
    end
  end
end
private

def sample_region
  Gotham::Region.new("test", 1)

end
