require_relative 'block.rb'
module Gotham
  class Region
    attr_accessor :blocks, :name, :connectors

    #TODO difficulty attribute, add to initializer with default of 0
    # and add method to remove 1 random path from a random path (not 0)
    # for each point of difficulty

    def initialize(name)
      @name = name
      @blocks = { 0 => Gotham::Block.new(0, self, [], 0, 0, 0, true),
        1 => Gotham::Block.new(1, self, [2,4,5], 0, 0, 0, false),
        2 => Gotham::Block.new(2, self, [1,3,4,5,6], 0, 0, 0, false),
        3 => Gotham::Block.new(3, self, [2,5,6], 0, 0, 0, false),
        4 => Gotham::Block.new(4, self, [1,2,5,7,8], 0, 0, 0, false),
        5 => Gotham::Block.new(5, self, [1,2,3,4,6,7,8,9], 0, 0, 0, false),
        6 => Gotham::Block.new(6, self, [2,3,5,8,9], 0, 0, 0, false),
        7 => Gotham::Block.new(7, self, [4,5,8], 0, 0, 0, false),
        8 => Gotham::Block.new(8, self, [4,5,6,7,9], 0, 0, 0, false),
        9 => Gotham::Block.new(9, self, [5,6,8], 0, 0, 0, false) }
      
      self.add_path(0)

      #difficulty should remove 1 path for each level of difficulty
      #make_difficult if difficulty > 0
      @connectors = []
    end

    def add_connection(endpoint)
      my_block = random_connector
      their_block = endpoint.random_connector
      my_block.add_connection(their_block)
      their_block.add_connection(my_block)
      @connectors << endpoint
      endpoint.connectors << self
    end

    def connects_to?(far_region)
      
    end
    def block(k)
      @blocks[k]
    end

    def random_block
      @blocks[rand(9) + 1]
    end

    def random_connector
      a = @blocks.reject {|k,v| k == 0 || ! v.connector.nil?}.keys
      @blocks[a.sample]
    end

    def add_path(from, to = random_block )
      from = @blocks[from] if from.kind_of?(Integer)
      to   = @blocks[to]   if   to.kind_of?(Integer)
            
      from.add_path(to.number)
      to.add_path(from.number)
    end

    def to_s
      "Region:#{@name}"
    end

    def to_map
      out = ""
      [[1,2,3],[4,5,6],[7,8,9]].each do |y|
        y.each do |x|
          out << @blocks[x].to_s + "   "
        end
        out << "\n"
      end
      out
    end
     
  end
end
