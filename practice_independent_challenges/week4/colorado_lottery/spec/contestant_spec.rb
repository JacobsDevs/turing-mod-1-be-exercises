require './lib/contestant'
require './lib/game'

RSpec.describe Contestant do
	describe '#initialize' do
		it 'exists and has parameters' do
			alexander = Contestant.new({first_name: 'Alexander',
				last_name: 'Aigiades',
				age: 28,
				state_of_residence: 'CO',
				spending_money: 10})
			expect(alexander.full_name).to eq('Alexander Aigiades')
			expect(alexander.age).to eq(28)
			expect(alexander.state_of_residence).to eq('CO')
			expect(alexander.spending_money).to eq(10)
			expect(alexander.game_interests).to eq([])
		end
	end
	describe '#out_of_state?' do
		it 'returns if contestant is resident of CO or not' do
			alexander = Contestant.new({first_name: 'Alexander',
				last_name: 'Aigiades',
				age: 28,
				state_of_residence: 'CO',
				spending_money: 10})
			expect(alexander.out_of_state?).to eq(false)
		end
	end
	describe '#add_game_interest' do
		it 'adds game name to the game_interests variable' do
			alexander = Contestant.new({first_name: 'Alexander',
				last_name: 'Aigiades',
				age: 28,
				state_of_residence: 'CO',
				spending_money: 10})
			mega_millions = Game.new('Mega Millions', 5, true)
			pick_4 = Game.new('Pick 4', 2)
			alexander.add_game_interest('Mega Millions')
			alexander.add_game_interest('Pick 4')
			expect(alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
		end
	end
end