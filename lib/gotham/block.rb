module Gotham
  class Block
    attr_accessor :paths, :crime, :streets, :disaster, :hideout

    attr_reader :number
    
    COLORS = [:white, :blue, :green, :yellow, :red]

    #Don't allow for more levels than there are color levels.'
    MAX_LEVEL = COLORS.length - 1
    def initialize(number,paths = [],crime = 0, streets = 0, disaster = 0, hideout = false)
      @number = number
      @paths = paths
      raise ::ArgumentError, "paths must be an array" unless @paths.is_a? Array
      @crime = crime
      @streets = streets
      @disaster = disaster
      @hideout = hideout
    end

    def to_s
      "#{number}.#{color(@streets)}.#{color(@disaster)}"
    end
     

    def add_path(to)
      @paths.push(to).uniq!
    end     

    def increase_crime(i = 1)
      @crime += i
      @crime = MAX_LEVEL if @crime > MAX_LEVEL
    end
    
    def increase_streets(i = 1)
      @streets += i
      @streets = MAX_LEVEL if @streets > MAX_LEVEL
    end
    
    def increase_disaster(i = 1)
      @disaster += i
      @disaster = MAX_LEVEL if @disaster > MAX_LEVEL
    end
    
    def decrease_crime(i = 1)
      @crime -= i
      @crime = 0 if @crime < 0
    end
    
    def decrease_streets(i = 1)
      @streets -= i
      @streets = 0 if @streets < 0
    end
    
    def decrease_disaster(i = 1)
      @disaster -= i
      @disaster = 0 if @disaster < 0
    end

    private
    def color(char, level = -1)
      level = char if level < 0
      char.to_s.colorize(COLORS[level])
    end

  end
end
