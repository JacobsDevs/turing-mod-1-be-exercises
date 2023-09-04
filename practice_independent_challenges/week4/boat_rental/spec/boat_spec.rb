require 'boat'

RSpec.describe Boat do
  before(:each) do
	  @kayak = Boat.new(:kayak, 20)
	end
  
	describe '#initialize' do
		it 'exists' do
		  expect(@kayak).to be_an_instance_of Boat
		end
		it 'has a type' do
			expect(@kayak.type).to eq(:kayak)
		end
		it 'has a price_per_hour' do
		  expect(@kayak.price_per_hour).to eq(20)
		end
		it 'has hours_rented' do
		  expect(@kayak.hours_rented).to eq(0)
		end
	end

  describe '#add_hour' do
	  it 'adds 1 hour to the hours_rented variable' do
		  @kayak.add_hour
			@kayak.add_hour
			expect(@kayak.hours_rented).to eq(2)
		end
	end
end
