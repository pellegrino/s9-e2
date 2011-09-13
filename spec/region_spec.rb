require 'spec_helper'
describe Gotham::Region do
  let!(:region) {  Gotham::Region.new("test")
}
  describe "#new" do
    it "should initialize with just name parameter" do
      region.name.should == "test"
    end

    it "should always have a block hash" do
      region.blocks.should be_a(Hash)
      region.should have(10).blocks
    end

    it "should add a random path between 0 and another block" do
      path_to = region.blocks[0].paths[0]

      path_to.should be_between(0, 9)
      region.blocks.should have_key(0)
      region.blocks[0].should have(1).paths
      region.blocks[path_to].paths.should include(0)
    end
  end

  describe "#add_path" do
    context "when called with integers in both from and to parameters" do
      it "should add paths to each other" do
        region.add_path(1,9)

        region.block(1).paths.should include(9)
        region.block(9).paths.should include(1)
      end
    end

    context "when called with objects in both from and to parameters" do
      it "should add paths to each other" do
        region.add_path(region.block(1),region.block(9))

        region.block(1).paths.should include(9)
        region.block(9).paths.should include(1)
      end
    end

    context "when called with a single parameter, selects a random to" do
      it "should add paths to each other" do
        region.stub(:random_block).and_return(region.block(7))

        region.add_path(1)

        region.block(1).paths.should include(7)
        region.block(7).paths.should include(1)
      end
    end
  end

  describe "#add_connection" do
    it "should add a 2 way connection" do
      far_region =  Gotham::Region.new("far region")

      region.stub(:random_connector).and_return(region.block(6))
      far_region.stub(:random_connector).and_return(far_region.block(2))

      region.add_connection(far_region)

      puts region.random_connector
      puts far_region.random_connector

          region.block(6).connector.number.should == 2
      far_region.block(2).connector.number.should == 6
      
    end

  end
end
private

def sample_region

end
