require './lib/turn'

class Round
attr_reader :deck, :turns, :current_card

	def initialize(deck)
		@deck = deck
		@turns = []
		@current_card = @deck.cards[0]
	end

	def take_turn(guess)
		turn = Turn.new(guess, @current_card)
		@turns << turn
		@deck.cards.shift
		@current_card = @deck.cards[0]
		turn
	end

	def number_correct
		correct = @turns.select do |turn|
			turn.correct?
		end
		return correct.length
	end

	def number_correct_by_category(category)
		correct = @turns.select do |turn|
			turn.correct? && turn.card.category == category
		end
		return correct.length
	end

	def percent_correct
	  return (number_correct.to_f / @turns.length.to_f * 100.0).round(2)
	end
	
	def percent_correct_by_category(category)
		turns_in_category = @turns.select {|turn| turn.card.category == category}
	  return (number_correct_by_category(category).to_f / turns_in_category.length.to_f * 100.0).round(2)
	end
end

