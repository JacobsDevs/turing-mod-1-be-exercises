class Groomer
  attr_reader :name,
	            :customers

	def initialize(name, customers= [])
		@name =  name
		@customers = customers
		@service_fee = {Haircut: 10, Wash: 20}
		@services = {}
	end

	def find_outstanding_balances
	  balances = Hash.new(0) 
		@customers.each do |customer|
			balances[customer.name.downcase.to_sym] = customer.outstanding_balance if customer.outstanding_balance > 0
		end
		balances
	end

	def count_pet_type(type)
	  pets = @customers.map do |customer|
			customer.pets.map do |pet|
				pet if pet.type == type
			end
		end 
		pets.flatten.count
	end

	def charge_service(service, customer, pet)
		pet.services_purchased << {service: service, fee: @service_fee[service.to_sym]}
		customer.charge(@service_fee[service.to_sym].to_i)
	end

	def invoice
		invoice = ""
		@customers.each do |customer|
			invoice += "Customer: #{customer.name}\n"
			customer.pets.each do |pet|
				invoice += "Pet: #{pet.name}\n"
				invoice += "All Paid Up\n" if pet.services_purchased.empty?
			  pet.services_purchased.each do |service|
					invoice += "#{service[:service]}: $#{service[:fee]}\n"
				end
			end
		end
		invoice
	end
end