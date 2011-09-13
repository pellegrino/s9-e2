require_relative "player.rb"
module Gotham
  class AllPlayers
    attr_accessor :players, :whose_turn, :available_heroes
    
    def pregen_chars
      @pregen_chars || {batman:    [3,3,3,3, "Heights", "Batcave"],
                        robin:     [3,2,3,4, "Financial District", "Wayne Tower"],
                        nightwing: [3,4,2,3, "Bludhaven", "the Loft"],
                        batgirl:   [4,3,2,3, "Gotham Docks", "Subway Station"],
                        oracle:    [5,1,2,4, "Downtown", "Clocktower"],
                        huntress:  [3,3,4,2, "Little Italy", "Aerie One"]}
    end

    def available_heroes
      @available_heroes
    end

    def initialize
      @players = []
      @available_heroes =  pregen_chars.dup
      @whose_turn = 0
    end

    def add_player(player)
      @players << Gotham::Player.new(player, *pregen_chars[player])
      @available_heroes.delete(player)
    end

    def player_regions
      players.collect {|p| [p.home,p.base]}
    end

    def set_starting_locations(map)
      players.each {|p| p.set_starting_location}
    end
  end
end