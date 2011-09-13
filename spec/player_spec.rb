require "spec_helper"

describe Gotham::Player do
  let!(:player) {Gotham::Player.new(:batman, 3,3,3,3, "Gotham Heights", "Batcave")}

  describe "#new" do
    it "should initialize" do
      player.name.should == :batman
      player.detecting.should == 3
      player.fighting.should == 3
      player.bravery.should == 3
      player.gadget_points.should == 3
      player.max_gadget_points.should == 3
      player.home.should == "Gotham Heights"
      player.base.should == "Batcave"
    end
  end

end
