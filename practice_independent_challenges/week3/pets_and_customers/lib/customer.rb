class Customer
	attr_reader :name,
	            :id,
							:pets,
							:outstanding_balance,
							:services_purchased

  def initialize(name, id)
		@name = name
		@id = id
		@pets = []
		@outstanding_balance = 0
	end

	def adopt(animal)
		@pets << animal
	end

	def charge(fee)
	  @outstanding_balance += fee
	end
end