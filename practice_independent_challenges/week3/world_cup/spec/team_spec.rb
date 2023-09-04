require 'team'
require 'player'

RSpec.describe Team do
  before(:each) do
	  @team = Team.new("Australia")
	end
	
	describe '#initialize' do
		it 'exists' do
			expect(@team).to be_an_instance_of Team
		end
		it 'has a country' do
		  expect(@team.country).to eq("Australia")
		end
	end

  describe '#eliminated?' do
	  it 'returns the eliminated status of the team' do
  	  expect(@team.eliminated?).to be(false)
			@team.eliminated = true
			expect(@team.eliminated?).to be(true)
		end
	end

	describe '#add_player' do
	  it 'players starts as an empty array' do
		  expect(@team.players).to eq([])
		end
		it 'adds players' do
		  boyo = Player.new ({name: "Boyo", position: "striker"})
			kingsley = Player.new ({name: "Kingsley", position: "midfielder"})
			@team.add_player(boyo)
			@team.add_player(kingsley)
			expect(@team.players).to eq([boyo, kingsley])
		end
	end

	describe '#players_by_position' do
	  it 'returns a list of players from the given position' do
			boyo = Player.new ({name: "Boyo", position: "striker"})
			kingsley = Player.new ({name: "Kingsley", position: "midfielder"})
			@team.add_player(boyo)
			@team.add_player(kingsley)
			expect(@team.players_by_position("midfielder")).to eq([kingsley])
			expect(@team.players_by_position("striker")).to eq([boyo])
		end
	end
end