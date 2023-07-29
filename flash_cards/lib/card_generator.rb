require './lib/card'

require './lib/deck'

class CardGenerator
  
	def initialize(filename)
	  @card_file = filename
		@deck = []
	end

	def cards
	  card_data = IO.readlines(@card_file)
		card_data.each do |card|
			readable_card = card.split(',')
			@deck << Card.new(readable_card[0], readable_card[1], readable_card[2].to_s.chomp)
		end
		@deck
	end

end
