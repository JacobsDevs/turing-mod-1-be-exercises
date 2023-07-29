class Deck
attr_reader :cards
	def initialize(array_of_cards)
		@cards = array_of_cards
	end

	def count
		cards.length
	end

	def cards_in_category(category)
		matching_cards = cards.select do |card|
			card if card.category == category
		end
	end
end