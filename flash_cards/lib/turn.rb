# Turn class takes two argumemts
# string is a guess to the cards question
# card is the current Card object being shown

class Turn
attr_reader :string, :card

  def initialize(string, card)
		@string = string
		@card = card
	end

	def guess
		@string
	end

	def card
    @card
	end

	def correct?
		return true if @string == @card.answer
		return false
	end

	def feedback
		result = self.correct?
		return "Correct!" if result == true
		return "Incorrect." if result == false
	end
end