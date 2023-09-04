class Venue
	attr_reader :name, :capacity, :patrons

	def initialize(name, capacity)
		@name = name
		@capacity = capacity
		@patrons = []
	end

	def add_patron(patron)
		@patrons << patron
	end

	def yell_at_patrons
		yelling = []
		@patrons.each do |patron|
			yelling << patron.upcase
		end
		yelling
	end

	def over_capacity?
	  return true if @capacity < @patrons.length
		return false if @capacity >= @patrons.length
	end

	def kick_out
	  @patrons.pop while over_capacity? == true
	end

end
