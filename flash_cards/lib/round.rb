require './lib/turn'

class Round
attr_reader :deck, :turns, :current_card

	def initialize(deck)
		@deck = deck
		@length_of_deck = @deck.cards.length
		@turns = []
		@current_card = @deck.cards[0]
		@card_number = 1
	end
	
	def get_categories
		categories = @turns.map do |turn|
			turn.card.category
		end
		categories.uniq
	end
	
	def start
	  puts "Welcome! You're playing with #{@length_of_deck} cards."
		puts "---------------------------------------------------"
		until @card_number > @length_of_deck do
		  puts "This is card number #{@card_number} out of #{@length_of_deck}"
		  puts "Question: #{@current_card.question}"
		  answer = gets.chomp.to_s
		  take_turn(answer)
			@card_number += 1
	  end
		game_over
	end
	
  def game_over
		categories = get_categories
	  puts "****** Game Over! ******"
		puts "You had #{number_correct} correct guesses out of #{@length_of_deck} for a total score of #{percent_correct}\%"
		categories.each do |category|
			puts "#{category.to_s} - #{percent_correct_by_category(category)}\% correct" 
		end
	end
  

	def take_turn(guess)
		turn = Turn.new(guess, @current_card)
		puts turn.feedback
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
	  return (number_correct_by_category(category).to_f / turns_in_category.length.to_f * 100.0).to_i
	end
end

