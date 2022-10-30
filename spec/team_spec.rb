require 'pry'
require './lib/player'
require './lib/team'

RSpec.describe Team do 
  it 'exists' do 
    team = Team.new("France")

    expect(team.country).to eq("France")
  end

  it 'team is not eliminated by default' do 
    team = Team.new("France")

    expect(team.eliminated?).to be false
  end

  it 'team can be eliminated' do
    team = Team.new("France", true)

    expect(team.eliminated?).to be true
  end

  it 'team has a roster of players' do 
    team = Team.new("France", true)

    expect(team.players.size).to eq(0)

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players).to eq([mbappe, pogba])
    expect(team.players.size).to eq(2)
  end

  it 'return players by position' do 
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players_by_position("midfielder")).to eq([pogba])
    expect(team.players_by_position("defender")).to eq([])
  end

end