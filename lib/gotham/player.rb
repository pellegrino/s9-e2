module Gotham
  class Player

    attr_accessor :gadget_points, :location
    attr_reader :name, :max_gadget_points, :detecting, :fighting, :bravery,
                :home, :base
 
    def initialize (name, detecting, fighting, bravery, gadgets, home, base)
      @name = name
      @detecting = detecting
      @fighting = fighting
      @bravery = bravery
      @gadget_points = @max_gadget_points = gadgets
      @home = home
      @base = base
    end

    def to_s
      @name.to_s.capitalize
    end

    #def set_starting_location(map)
    #  @location = map.regions[@home].block(0)
    #end
  end
end
 
