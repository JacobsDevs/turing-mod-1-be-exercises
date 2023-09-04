class ColoradoLottery
  attr_reader :registered_contestants,
							:winners,
							:current_contestants

	def initialize
		@registered_contestants = Hash.new {|h, k| h[k] = []}
		@current_contestants = Hash.new {|h, k| h[k] = []}
		@winners = []
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
			contestant
		else
			false
		end
	end

	def eligible_contestants(game)
		@registered_contestants[game].select {|contestant| contestant.spending_money > game.cost}
	end

	def current_contestants
	  @registered_contestants.each do |game, contestants|
			eligible = eligible_contestants(game)
			charge(eligible, game)
			@current_contestants[game] += eligible.map {|contestant| contestant.full_name}
		end
		@current_contestants
	end

	def charge(contestants, game)
		contestants.each {|contestant| contestant.spending_money -= game.cost}
	end
end