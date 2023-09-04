require 'rspec'
require_relative '../lib/dish'
require_relative '../lib/potluck'
 # Iteration 2

RSpec.describe Potluck do
	before(:each) do
	  @potluck = Potluck.new("7-13-18")
	end

	it 'exists' do
		expect(@potluck).to be_an_instance_of Potluck
	end

	it 'has a date' do
		expect(@potluck.date).to eq "7-13-18"
	end

	it 'starts with no dishes' do
		expect(@potluck.dishes).to eq []
	end

	describe '#add_dish' do
	  it 'adds dishes' do
			couscous_salad = Dish.new("Couscous Salad", :appetizer)
			@potluck.add_dish(couscous_salad)
			expect(@potluck.dishes).to eq [couscous_salad]
		end

		it 'can add a second dish' do
			cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
			@potluck.add_dish(cocktail_meatballs)
			couscous_salad = Dish.new("Couscous Salad", :appetizer)
			@potluck.add_dish(couscous_salad)
			expect(@potluck.dishes).to eq [cocktail_meatballs, couscous_salad]
		end

		it 'can count dishes held' do 
			cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
			@potluck.add_dish(cocktail_meatballs)
			couscous_salad = Dish.new("Couscous Salad", :appetizer)
			@potluck.add_dish(couscous_salad)
			expect(@potluck.dishes.count).to eq 2
		end
	end

	# Iteration 3
	describe '#get_all_from_category' do
		it 'returns all dishes from a category' do
			couscous_salad = Dish.new("Couscous Salad", :appetizer)
			summer_pizza = Dish.new("Summer Pizza", :appetizer)
			roast_pork = Dish.new("Roast Pork", :entre)
			@potluck.add_dish(couscous_salad)
			@potluck.add_dish(summer_pizza)
			@potluck.add_dish(roast_pork)
			expect(@potluck.get_all_from_category(:appetizer)).to eq [couscous_salad, summer_pizza]
		end

		it 'returns the first item from that category' do
		  couscous_salad = Dish.new("Couscous Salad", :appetizer)
			summer_pizza = Dish.new("Summer Pizza", :appetizer)
			roast_pork = Dish.new("Roast Pork", :entre)
			@potluck.add_dish(couscous_salad)
			@potluck.add_dish(summer_pizza)
			@potluck.add_dish(roast_pork)
			expect(@potluck.get_all_from_category(:appetizer).first).to eq couscous_salad
		end

		it 'returns the first items Name from that category' do
		  couscous_salad = Dish.new("Couscous Salad", :appetizer)
			summer_pizza = Dish.new("Summer Pizza", :appetizer)
			roast_pork = Dish.new("Roast Pork", :entre)
			@potluck.add_dish(couscous_salad)
			@potluck.add_dish(summer_pizza)
			@potluck.add_dish(roast_pork)
			expect(@potluck.get_all_from_category(:appetizer).first.name).to eq "Couscous Salad"
		end
	end

	describe '#menu' do
	  it 'returns an alphabetized list of meals categorized into their categories' do
		  couscous_salad = Dish.new("Couscous Salad", :appetizer)
			summer_pizza = Dish.new("Summer Pizza", :appetizer)
			roast_pork = Dish.new("Roast Pork", :entre)
			@potluck.add_dish(summer_pizza)
			@potluck.add_dish(couscous_salad)
			@potluck.add_dish(roast_pork)
			expect(@potluck.menu).to eq({:appetizers=>["Couscous Salad", "Summer Pizza"], :entres=>["Roast Pork"]})
		end
	end

	describe '#ratio' do
    it 'returns the ratio of each category in the potluck' do
		  couscous_salad = Dish.new("Couscous Salad", :appetizer)
			summer_pizza = Dish.new("Summer Pizza", :appetizer)
			roast_pork = Dish.new("Roast Pork", :entre)
			@potluck.add_dish(summer_pizza)
			@potluck.add_dish(couscous_salad)
			@potluck.add_dish(roast_pork)
			expect(@potluck.ratio(:appetizer)).to eq(66.67)
	  end
	end
end