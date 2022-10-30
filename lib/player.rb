require 'pry'

class Player 
  attr_reader :name,
              :position

  def initialize(player_hash)
    @name = player_hash[:name] 
    @position = player_hash[:position]
  end

end