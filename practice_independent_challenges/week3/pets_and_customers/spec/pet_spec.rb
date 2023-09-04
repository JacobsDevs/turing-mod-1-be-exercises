require 'rspec'
require_relative "../lib/pet"

RSpec.describe Pet do
	before(:each) do
	  @samson = Pet.new(name: "Samson", type: :dog, age: 3)
	end

	describe '#initialize' do
		it 'exists' do
		  expect(@samson).to be_an_instance_of Pet
		end
	  it 'returns name' do
			expect(@samson.name).to eq("Samson")
		end
		it 'returns age' do 
			expect(@samson.age).to eq(3)
		end
	end
	describe '#fed?' do
		it 'starts false' do
			expect(@samson.fed?).to eq(false)
		end
	end
	describe '#feed' do
		it 'changes #fed? to true' do
		  @samson.feed
			expect(@samson.fed?).to eq(true)
		end
	end  
end