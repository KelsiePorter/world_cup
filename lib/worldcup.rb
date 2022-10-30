require 'pry'

class WorldCup 
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_players.find_all do |player|
      player.position == position
    end
  end

  def active_players
    active_teams = @teams.find_all do |team|
      !team.eliminated?
    end
    active_players = []
    active_teams.map do |team|
      active_players << team.players
    end
    active_players.flatten!
  end

  def all_players_by_position 
    players = @teams.map do |team|
      team.players
    end
    all_players = players.flatten!
    grouped_by_position = {}
    
    player_positions = all_players.map do |player|
      player.position
    end
    
    player_positions.uniq.each do |position|
      players_by_position = all_players.find_all {|player| player.position == position}
      grouped_by_position[position] = players_by_position
    end
    grouped_by_position
  end

end