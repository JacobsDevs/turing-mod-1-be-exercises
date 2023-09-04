require 'dock'
require 'renter'
require 'boat'

RSpec.describe Dock do
  before(:each) do
	  @dock = Dock.new("The Rowing Dock", 3)
		@kayak_1 = Boat.new(:kayak, 20)
		@kayak_2 = Boat.new(:kayak, 20)
		@sup_1 = Boat.new(:standup_paddle_board, 15)
		@patrick = Renter.new("Patrick Star", "4242424242424242") 
		@eugene = Renter.new("Eugene Crabs", "1313131313131313")  
	end

	describe '#initialize' do
	  it 'exists' do
			expect(@dock).to be_an_instance_of Dock
		end
		it 'has a name' do
			expect(@dock.name).to eq("The Rowing Dock")
		end
		it 'has a maximum rental time' do
			expect(@dock.maximum_rental_time).to eq(3)
		end
		it 'has an empty hash called rental_log' do
			expect(@dock.rental_log).to eq({})
		end
	end

	describe '#rent' do
	  it 'stores a rental as an array in rental_log' do
		  @dock.rent(@kayak_1, @patrick)
			@dock.rent(@sup_1, @eugene)
			expect(@dock.rental_log).to eq({@kayak_1 => @patrick, @sup_1 => @eugene})
		end
	end

	describe '#charge' do
	  it 'returns a hash with :card_number & :amount' do
		  @dock.rent(@kayak_1, @patrick)
			@kayak_1.add_hour
			@kayak_1.add_hour
			expect(@dock.charge(@kayak_1)).to eq({:card_number => @patrick.credit_card_number, :amount => 40})
		end
		it 'will not charge over maximum_rental_time' do
			@dock.rent(@kayak_1, @patrick)
			@kayak_1.add_hour
			@kayak_1.add_hour
			@kayak_1.add_hour
			@kayak_1.add_hour
			expect(@dock.charge(@kayak_1)).to eq({:card_number => @patrick.credit_card_number, :amount => 60})
		end
	end

	describe '#return' do
	  it 'adds returned boat to the returned_boats list' do
			@dock.rent(@kayak_1, @patrick)
			@dock.rent(@sup_1, @eugene)
			@dock.return(@sup_1)
			expect(@dock.rental_log).to eq({@kayak_1 => @patrick, @sup_1 => @eugene})
			expect(@dock.returned_boats).to eq([@sup_1])
		end
	end

	describe '#log_hour' do
		it 'adds 1 hour to the hours_rented of each boat in the rental_log' do
		  @dock.rent(@kayak_1, @patrick)
			@dock.rent(@sup_1, @eugene)
			@dock.log_hour
			expect(@kayak_1.hours_rented).to eq(1)
			expect(@sup_1.hours_rented).to eq(1)
		end
	end

	describe '#revenue' do
	  it 'returns the total revenue by charging all boats that have been rented and then returned' do
		  @dock.rent(@kayak_1, @patrick)
			@dock.rent(@sup_1, @eugene)
			@dock.log_hour
			@dock.log_hour
			@dock.log_hour
			@dock.return(@kayak_1)
			@dock.return(@sup_1)
			expect(@dock.revenue).to eq(105)
		end
	end
end