class Pet
  attr_reader :name,
	            :age,
							:type,
							:services_purchased

	def initialize(pet_data)
    @name = pet_data[:name]
		@type = pet_data[:type]
		@age = pet_data[:age]
		@fed = false
		@services_purchased= []
	end

	def fed?
	  @fed
	end

	def feed
		@fed = true
	end
end