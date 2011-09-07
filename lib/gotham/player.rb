module Gotham
  class Player
    class << self 
      def pregen_chars
        {batman: [3,3,3,3], robin: [3,2,3,4], nightwing: [3,4,2,3],
        batgirl: [4,3,2,3], oracle: [5,1,2,4], huntress: [3,3,4,2]} 
      end
     
      def available_heroes
        pregen_chars.keys.map{ |p| p.to_s.capitalize }.join(", ")
      end
 
      def pregen(character = :batman)
        character = character.downcase.to_sym if character.is_a?(String)
        raise ::ArgumentError, "Unknown hero"  unless @pregen_chars.has_key?(character)
        self.new(character.to_s, *@pregen_chars[character])
      end
    end
     
    attr_accessor :gadget_points
    attr_reader :name, :max_gadget_points, :detecting, :fighting, :bravery
 
    def initialize (name, detecting, fighting, bravery, gadgets)
      @name = name
      @detecting = detecting
      @fighting = fighting
      @bravery = bravery
      @gadget_points = @max_gadget_points = gadgets
    end
 
  end
end
 
