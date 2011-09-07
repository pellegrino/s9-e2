module Gotham
  class Block
    attr_accessor :number, :paths, :crime, :streets, :disaster, :hideout 
    COLORS = [:white, :blue, :green, :yellow, :red]

    def initialize(number,paths = [],crime = 0, streets = 0, disaster = 0, hideout = false)
      @number = number
      @paths = paths
      raise ::ArgumentError, "paths must be an array" unless @paths.is_a? Array
      @crime = crime
      @streets = streets
      @disaster = disaster
      @hideout = false
    end

    def to_s
      "#{number}.#{color(@streets)}.#{color(@disaster)}"
    end
     
    def color(char, level = -1) 
      level = char if level < 0
      char.to_s.colorize(COLORS[level])
    end

    def add_path(to)
      @paths.push(to).uniq!
    end     

    def increase_crime
      @crime += 1
    end 
    def increase_streets
      @streets += 1
    end 
    def increase_disaster
      @disaster += 1
    end 
    def decrease_crime
      @crime -= 1
    end 
    def decrease_streets
      @streets -= 1
    end 
    def decrease_disaster
      @disaster -= 1
    end 
  end
end
