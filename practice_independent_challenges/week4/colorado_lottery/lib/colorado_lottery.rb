class ColoradoLottery
  attr_reader :registered_contestants,
							:winners,
							:current_contestants

	def initialize
		@registered_contestants = {}
		@winners = []
		@current_contestants = {}
	end

	def interested_and_18?(contestant, game)
		contestant.age >= 18 && contestant.game_interests.include?(game.name)
	end

	def can_register?(contestant, game)
	  interested_and_18?(contestant, game) && valid_location?(contestant, game)
	end

	def valid_location?(contestant, game)
		contestant.state_of_residence == 'CO' || game.national_drawing?
	end
end