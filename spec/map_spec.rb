require "spec_helper"

describe Gotham::Map do
  let!(:map) {Gotham::Map.new("heights", "docks", "downtown","uptown")}
  describe "#new" do
    it "should initialize" do
      map.should have(4).regions
      map.regions.should have_key("heights")
      map.regions.should have_key("docks")
      map.regions.should have_key("downtown")
      map.regions.should have_key("uptown")

      map.regions["heights"].connectors.should_not
                                            include(map.regions["uptown"])
    end

    it "should initialize with base_regions" do
      my_map = Gotham::Map.new(*Gotham.base_regions)
      
      my_map.should have(2).regions
    end


  end
end