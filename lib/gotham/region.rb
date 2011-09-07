module Gotham
  class Region
    attr_accessor :blocks, :name, :connectors 
    
    @level_colors = [:white, :blue, :green, :yellow, :red]

    def initialize(name, difficulty = 0)
      @name = name
      @blocks = { 0 => Gotham::Block.new(0, [], 0, 0, 0, true),
        1 => Gotham::Block.new(1, [2,4,5], 0, 0, 0, false),
        2 => Gotham::Block.new(2, [1,3,4,5,6], 0, 0, 0, false),
        3 => Gotham::Block.new(3, [2,5,6], 0, 0, 0, false),
        4 => Gotham::Block.new(4, [1,2,5,7,8], 0, 0, 0, false),
        5 => Gotham::Block.new(5, [1,2,3,4,6,7,8,9], 0, 0, 0, false),
        6 => Gotham::Block.new(6, [2,3,5,8,9], 0, 0, 0, false),
        7 => Gotham::Block.new(7, [4,5,8], 0, 0, 0, false),
        8 => Gotham::Block.new(8, [4,5,6,7,9], 0, 0, 0, false),
        9 => Gotham::Block.new(9, [5,6,8], 0, 0, 0, false) }

      add_path(0) 
    end

    def random_block
      rand(9) + 1
    end

    def add_path(from, to = random_block )
      @blocks[from].add_path(to)
      @blocks[to].add_path(from)
    end
  
    def to_s
      out = ""
      [[1,2,3],[4,5,6],[7,8,9]].each do |y|
        y.each do |x|
          out << @blocks[x].to_s + "   "
        end
        out << "\n"
      end
      out
    end
     
    def color(char, level = -1) 
      level = char if level < 0
      char.colorize(@level_colors[level])
    end
      
  end
end
