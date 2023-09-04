require_relative './candy'

class Bag
  attr_accessor :candies,
							:count
	def initialize
		@candies = []
	end

	def empty?
		@candies.empty?
	end

	def add_candy(candy)
		@candies << candy
	end

	def contains?(candy)
		@candies.map {|candy| candy.type}.include?(candy)
	end

	def count
	  @candies.length
	end

	def call
	  @candies
	end
end