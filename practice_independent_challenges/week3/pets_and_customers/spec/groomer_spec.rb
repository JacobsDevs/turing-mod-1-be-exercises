require 'rspec'
require_relative '../lib/customer'
require_relative '../lib/pet'
require_relative '../lib/groomer'

RSpec.describe Groomer do
  
	before(:each) do
		@joseph = Pet.new({name: "Joseph", type: :cat, age: 2})
		@francis = Pet.new({name: "Francis", type: :cat, age: 1})
		@jim = Customer.new("Jim", 2)
		@jill = Customer.new("Jill", 3)
		@jim.adopt(@joseph)
		@jill.adopt(@francis)
		@customers = [@jim, @jill]
	  @groomer = Groomer.new("Pam", @customers)
	end
	
	describe '#initialize' do
	  it 'exists' do
		  expect(@groomer).to be_an_instance_of Groomer
		end
		it 'returns a name' do
			expect(@groomer.name).to eq('Pam')
		end
		it 'returns a list of customers' do
			expect(@groomer.customers.first).to be_an_instance_of Customer
			expect(@groomer.customers.length).to eq(2) 
		end
	end

	describe '#find_outstanding_balances' do
	  it 'returns a hash of all customers with outstanding balances' do
		  @groomer.customers.first.charge(2)
			expect(@groomer.find_outstanding_balances).to eq({jim: 2})
		end
	end
	
	describe '#count_pet_type' do
		it 'returns how many of a specific type animal there is' do
			expect(@groomer.count_pet_type(:cat)).to eq(2)
			sid = Pet.new({name: "Sid", type: :cat, age: 8})
			@jim.adopt(sid)
			expect(@groomer.count_pet_type(:cat)).to eq(3)
		end
	end

	describe '#charge_service' do
		it 'can charge a service' do
			@groomer.charge_service('Haircut', @jim, @joseph)
		  expect(@joseph.services_purchased.first).to eq({:fee=>10, :service=>"Haircut"})
			expect(@jim.outstanding_balance).to eq(10)
		end
	end

	describe '#invoice' do
		it 'gives a list of charges ordered by customer and pet' do
		  @groomer.charge_service('Haircut', @jim, @joseph)
			@groomer.charge_service('Wash', @jim, @joseph)
			@jim.adopt(Pet.new({name: "Kyle", type: :dog, age: 3}))
			@groomer.charge_service('Haircut', @jill, @francis)
			expect(@groomer.invoice).to eq("Customer: Jim\nPet: Joseph\nHaircut: $10\nWash: $20\nPet: Kyle\nAll Paid Up\nCustomer: Jill\nPet: Francis\nHaircut: $10\n")
		end
	end
end