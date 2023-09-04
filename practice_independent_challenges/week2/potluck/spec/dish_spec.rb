require 'rspec'
require_relative '../lib/dish'

RSpec.describe Dish do
  before(:each) do
	  @dish = Dish.new("Couscous Salad", :appetizer)
	end
 # Iteration 1
  it 'exists' do
    expect(@dish).to be_an_instance_of Dish
  end

	it 'returns the name of the dish' do
	  expect(@dish.name).to eq("Couscous Salad")
	end

	it 'returns the course of the dish' do
		expect(@dish.category).to eq :appetizer
	end
end