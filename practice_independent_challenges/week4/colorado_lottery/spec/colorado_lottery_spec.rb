require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'

RSpec.describe ColoradoLottery do
	describe '#initialize' do
		it 'exists and has parameters' do
			lottery = ColoradoLottery.new
			expect(lottery.registered_contestants).to eq({})
			expect(lottery.winners).to eq([])
			expect(lottery.current_contestants).to eq({})
		end
	end
	describe '#interested_and_18?' do
		it 'checks if a Contestant is over 18 and interested in game' do
			lottery = ColoradoLottery.new
			pick_4 = Game.new('Pick 4', 2)
			mega_millions = Game.new('Mega Millions', 5, true)
			cash_5 = Game.new('Cash 5', 1)
			alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
			benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
			frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
			winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
			alexander.add_game_interest('Pick 4')
			alexander.add_game_interest('Mega Millions')
			frederick.add_game_interest('Mega Millions')
			winston.add_game_interest('Cash 5')
			winston.add_game_interest('Mega Millions')
			benjamin.add_game_interest('Mega Millions')
			
			expect(lottery.interested_and_18?(alexander, pick_4)).to eq(true)
			expect(lottery.interested_and_18?(benjamin, mega_millions)).to eq(false)
			expect(lottery.interested_and_18?(alexander, cash_5)).to eq(false)
		end
	end
	describe '#can_register?' do
		it 'returns true if interested_and_18? & local or playing national drawing' do
			lottery = ColoradoLottery.new
			pick_4 = Game.new('Pick 4', 2)
			mega_millions = Game.new('Mega Millions', 5, true)
			cash_5 = Game.new('Cash 5', 1)
			alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
			benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
			frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
			winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
			alexander.add_game_interest('Pick 4')
			alexander.add_game_interest('Mega Millions')
			frederick.add_game_interest('Mega Millions')
			winston.add_game_interest('Cash 5')
			winston.add_game_interest('Mega Millions')
			benjamin.add_game_interest('Mega Millions')
			
			expect(lottery.can_register?(alexander, pick_4)).to eq(true)
			expect(lottery.can_register?(alexander, cash_5)).to eq(false)
			expect(lottery.can_register?(frederick, mega_millions)).to eq(true)
			expect(lottery.can_register?(benjamin, mega_millions)).to eq(false)
			expect(lottery.can_register?(frederick, cash_5)).to eq(false)
		end
	end
	describe '#register_contestant' do
	  it 'registers a contestant for a game that #can_register?' do
			lottery = ColoradoLottery.new
			pick_4 = Game.new('Pick 4', 2)
			mega_millions = Game.new('Mega Millions', 5, true)
			cash_5 = Game.new('Cash 5', 1)
			alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
			benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
			frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
			winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
			alexander.add_game_interest('Pick 4')
			alexander.add_game_interest('Mega Millions')
			frederick.add_game_interest('Mega Millions')
			winston.add_game_interest('Cash 5')
			winston.add_game_interest('Mega Millions')
			benjamin.add_game_interest('Mega Millions')

			expect(lottery.register_contestant(alexander, mega_millions)).to eq(alexander)
			expect(lottery.register_contestant(winston, mega_millions)).to eq(winston)
			expect(lottery.register_contestant(benjamin, mega_millions)).to eq(false)
			expect(lottery.registered_contestants).to eq({mega_millions=>[alexander, winston]})
		end
	end
  describe '#eligible_contestants' do
		it 'returns an array of contestants registered for a particular game who has enough spending money' do
			lottery = ColoradoLottery.new
			pick_4 = Game.new('Pick 4', 2)
			mega_millions = Game.new('Mega Millions', 5, true)
			cash_5 = Game.new('Cash 5', 1)
			alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
			benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
			frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
			winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 4})
			alexander.add_game_interest('Mega Millions')
			frederick.add_game_interest('Mega Millions')
			winston.add_game_interest('Mega Millions')
			benjamin.add_game_interest('Mega Millions')

			lottery.register_contestant(alexander, mega_millions)
			lottery.register_contestant(frederick, mega_millions)
			lottery.register_contestant(winston, mega_millions)
			lottery.register_contestant(benjamin, mega_millions)

			expect(lottery.eligible_contestants(mega_millions)).to eq([alexander, frederick])
		end
	end
	describe '#current_contestants' do
		it 'charges all eligible_contestants and puts them in current_contestants' do
			lottery = ColoradoLottery.new
			pick_4 = Game.new('Pick 4', 2)
			mega_millions = Game.new('Mega Millions', 5, true)
			cash_5 = Game.new('Cash 5', 1)
			alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
			benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
			frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
			winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 4})
			alexander.add_game_interest('Mega Millions')
			frederick.add_game_interest('Mega Millions')
			winston.add_game_interest('Mega Millions')
			benjamin.add_game_interest('Mega Millions')

			lottery.register_contestant(alexander, mega_millions)
			lottery.register_contestant(frederick, mega_millions)
			lottery.register_contestant(winston, mega_millions)
			lottery.register_contestant(benjamin, mega_millions)

			expect(lottery.current_contestants).to eq({mega_millions=>["Alexander Aigades", "Frederick Douglass"]})
		end
	end
end