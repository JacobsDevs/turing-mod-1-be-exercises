require 'world_cup'
require 'player'
require 'team'

RSpec.describe WorldCup do
  before(:each) do
		@france = Team.new("France")
		@mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
		@pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
		@france.add_player(@mbappe)
		@france.add_player(@pogba)

		@croatia = Team.new("Croatia") 
		@modric = Player.new({name: "Luka Modric", position: "midfielder"})
		@vida = Player.new({name: "Domagoj Vida", position: "defender"})
		@croatia.add_player(@modric)
		@croatia.add_player(@vida)
		teams = [@france, @croatia]

	  @world_cup = WorldCup.new(2018, teams)
	end

	describe '#initialize' do
		it 'exists' do
			expect(@world_cup).to be_an_instance_of WorldCup
		end
		it 'has teams' do
			expect(@world_cup.teams).to eq([@france, @croatia])	
		end
		it 'has a year' do
			expect(@world_cup.year).to eq(2018)
		end
	end

	describe '#active_players_by_position' do
	  it 'returns an array of players on active teams for a given position' do
		  expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
			@croatia.eliminated = true
			expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba])
		end
	end

	describe '#all_players_by_position' do
	  it 'returns a hash of players from all teams with their position as the key' do
		  expect(@world_cup.all_players_by_position).to eq({"forward" => [@mbappe], "midfielder" => [@pogba, @modric], "defender" => [@vida]})
		end
	end
end