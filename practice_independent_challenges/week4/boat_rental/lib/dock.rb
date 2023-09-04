class Dock
	attr_reader :name,
	            :maximum_rental_time,
							:rental_log,
							:returned_boats

	def initialize(name, maximum_rental_time)
		@name = name
		@maximum_rental_time = maximum_rental_time
		@rental_log = {}
		@returned_boats = []
	end

	def rent(boat, renter)
		@rental_log[boat] = renter
	end

	def charge(boat)
		{card_number: @rental_log[boat].credit_card_number, amount: (boat.price_per_hour * boat.hours_rented.clamp(0, @maximum_rental_time))}
	end

	def return(boat)
		@returned_boats << boat
	end

	def log_hour
	  @rental_log.keys.each {|boat| boat.add_hour unless @returned_boats.include?(boat)} 
	end

	def revenue
	  @returned_boats.inject(0) {|sum, (boat,renter)| sum + charge(boat)[:amount] if @returned_boats.include?(boat)}
	end
end