class Potluck
  attr_reader :date, :dishes

	def initialize(date)
		@date = date
		@dishes = []
	end

	def add_dish(dish)
		@dishes << dish if dish.is_a? Dish
		
	end

	def get_all_from_category(category) 
		all_from_category = []
    dishes.each do |dish|
			all_from_category << dish if dish.category == category
		end
		return all_from_category
	end

	def menu
		menu = Hash.new {|key, value| key[value] = []}
		@dishes.each do |dish|
			menu[(dish.category.to_s + "s").to_sym] << dish.name
		end
		menu.each do |key, value|
			value.sort!
		end
		return menu
	end

	def ratio(category)
		menu = self.menu
		category = (category.to_s + "s").to_sym
    total = 0.0
		menu.each do |key, value|
			total += value.length
		end
		ratio = ((menu[category].length.to_f / total.to_f) * 100).round(2)
				
	end
end