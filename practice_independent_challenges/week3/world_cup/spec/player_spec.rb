require 'player'

RSpec.describe Player do
  before(:each) do
	  @player = Player.new({name: "Caspian", position: "midfielder"})
	end
	describe '#initialize' do
	  it 'exists' do
		  expect(@player).to be_an_instance_of Player
		end
		it 'has a name' do
			expect(@player.name).to eq("Caspian")
		end
		it 'has a position' do
			expect(@player.position).to eq("midfielder")
		end
	end
end