require 'rspec'
require './lib/pet'
require './lib/customer'

RSpec.describe Customer do
  before(:each) do
	  @joel = Customer.new("Joel", 2)
		@samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
	end

	describe '#initialize' do
	  it 'exists' do
		  expect(@joel).to be_an_instance_of Customer
		end
		it 'returns a name' do
		  expect(@joel.name).to eq("Joel")
		end
		it 'returns an id' do
		  expect(@joel.id).to eq(2)
		end
		it 'returns an empty list of pets on initialize' do
		  expect(@joel.pets).to eq([])
		end
		it 'starts with 0 outstanding balance' do
		  expect(@joel.outstanding_balance).to eq(0)
		end
	end

	describe '#adopt' do
	  it 'adds animal to Customer#pets' do
		  @joel.adopt(@samson)
			expect(@joel.pets.first).to be_an_instance_of Pet
		end
	end

	describe '#charge' do
	  it 'adds to outstanding_balance' do
		  @joel.charge(15)
			expect(@joel.outstanding_balance).to eq(15)
		end
	end
end