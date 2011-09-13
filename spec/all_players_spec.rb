require "spec_helper"

describe Gotham::AllPlayers do
  let!(:all_players) {Gotham::AllPlayers.new()}
 
   describe "#new" do
    it "should initialize" do
      all_players.players.should be_empty
      all_players.available_heroes.should be_a(Hash)
      all_players.whose_turn.should == 0
    end
  end

  describe "#add_player" do
    it "should add players correctly" do
      who = all_players.available_heroes.keys[0]
      initial_count = all_players.pregen_chars.length
      all_players.add_player(who)

      all_players.should have(1).players
      all_players.players[0].name == who
      all_players.should have(initial_count - 1).available_heroes
      all_players.should have(1).player_regions
      all_players.player_regions[0].should == all_players.pregen_chars[who][4,5]
    end
  end
end