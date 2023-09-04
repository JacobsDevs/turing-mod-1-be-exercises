class ColoradoLottery
  attr_reader :registered_contestants,
							:winners,
							:current_contestants

	def initialize
		@registered_contestants = Hash.new {|h, k| h[k] = []}
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

	def register_contestant(contestant, game)
    if can_register?(contestant, game)
			@registered_contestants[game] << contestant
			return contestant
		else
			return false
		end
	end
end