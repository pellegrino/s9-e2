require "spec_helper"

describe Gotham::Block, "#new" do

  it "should do initialize with only a number parameter" do
    block = Gotham::Block.new(1)
    block.number.should == 1
    block.paths.should be_empty
    block.crime.should == 0
    block.streets.should == 0
    block.disaster.should == 0

    block.hideout.should == false
  end

  it "should initialize with all parameters set" do
    block = sample_block
    block.number.should == 1
    block.paths.should == [1, 2, 4, 5]
    block.crime.should == 1
    block.streets.should == 2
    block.disaster.should == 3

    block.hideout.should == true
  end

end

describe Gotham::Block, "#to_s" do

  it "should output a colorized string representation of itself." do
    block = sample_block

    block.to_s.should == "1.\e[0;32;49m2\e[0m.\e[0;33;49m3\e[0m"

    block.streets = 3
    block.disaster = 1

    block.to_s.should == "1.\e[0;33;49m3\e[0m.\e[0;34;49m1\e[0m"

  end

end

describe Gotham::Block, "#add_path" do

  it "should add a path" do
    block = sample_block
    block.add_path(0)

    block.paths.should include(0, 1, 2, 4, 5)
  end

  it "should remove duplicate entries in path" do
    block = sample_block
    block.add_path(0)
    block.add_path(1)
    block.add_path(2)
    block.add_path(4)
    block.add_path(5)

    block.paths.should include(0, 1, 2, 4, 5)
  end
end

describe Gotham::Block, "#increase_crime" do
  context "without a parameter" do
    it "Should increase the crime factor by 1" do
      block = sample_block
      block.increase_crime

      block.crime.should == 2
    end
  end

  context "with a parameter" do
    it "Should increase the crime factor by 1" do
      block = sample_block
      block.increase_crime(2)

      block.crime.should == 3
    end
  end

  it "should not increase crime level above MAX_LEVEL" do
    block = sample_block
    block.increase_crime(5)

    block.crime.should == Gotham::Block::MAX_LEVEL
  end
end

describe Gotham::Block, "#decrease_crime" do
  context "without a parameter" do
    it "Should decrease the crime factor" do
      block = sample_block
      block.decrease_crime

      block.crime.should == 0
    end
  end

  context "with a parameter" do
    it "Should decrease the crime factor" do
      block = sample_block
      block.crime = 3
      block.decrease_crime(2)

      block.crime.should == 1
    end
  end

  it "should not decrease crime level below 0" do
    block = sample_block
    block.decrease_crime(5)

    block.crime.should == 0
  end

end

describe Gotham::Block, "#increase_streets" do
  context "without a parameter" do
    it "Should increase the streets factor by 1" do
      block = sample_block
      block.increase_streets

      block.streets.should == 3
    end
  end

  context "with a parameter" do
    it "Should increase the streets factor by the parameter" do
      block = sample_block
      block.increase_streets(2)

      block.streets.should == 4
    end
  end

  it "should not increase streets level above MAX_LEVEL" do
    block = sample_block
    block.increase_streets(5)

    block.streets.should == Gotham::Block::MAX_LEVEL
  end
end

describe Gotham::Block, "#decrease_streets" do
  context "without a parameter" do
    it "Should decrease the streets factor" do
      block = sample_block
      block.decrease_streets

      block.streets.should == 1
    end
  end

  context "with a parameter" do
    it "Should decrease the streets factor" do
      block = sample_block
      block.streets = 3
      block.decrease_streets(2)

      block.streets.should == 1
    end
  end

  it "should not decrease streets level below 0" do
    block = sample_block
    block.decrease_streets(5)

    block.streets.should == 0
  end

end

describe Gotham::Block, "#increase_disaster" do
  context "without a parameter" do
    it "Should increase the disaster factor by the parameter" do
      block = sample_block
      block.increase_disaster

      block.disaster.should == 4
    end
  end

  context "with a parameter" do
    it "Should increase the disaster factor by parameter" do
      block = sample_block
      block.disaster = 1
      block.increase_disaster(2)
      block.disaster.should == 3
    end
  end

  it "should not increase disaster level above MAX_LEVEL" do
    block = sample_block
    block.increase_disaster(5)

    block.disaster.should == Gotham::Block::MAX_LEVEL
  end

end

describe Gotham::Block, "#decrease_disaster" do
  context "without a parameter" do
    it "Should decrease the disaster factor" do
      block = sample_block
      block.decrease_disaster

      block.disaster.should == 2
    end
  end

  context "with a parameter" do
    it "Should decrease the disaster factor" do
      block = sample_block
      block.disaster = 3
      block.decrease_disaster(2)

      block.disaster.should == 1
    end
  end

  it "should not decrease disaster level below 0" do
    block = sample_block
    block.decrease_disaster(5)

    block.disaster.should == 0
  end

end

private

def sample_block
  Gotham::Block.new(1, [1, 2, 4, 5], 1, 2, 3, true)
end