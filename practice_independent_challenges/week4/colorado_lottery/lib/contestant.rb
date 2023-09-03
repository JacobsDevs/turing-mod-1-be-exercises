class Contestant
	attr_reader :full_name,
							:age,
							:state_of_residence,
							:spending_money,
							:game_interests

  def initialize(data)
		@first_name = data[:first_name]
		@last_name = data[:last_name]
		@full_name = "#{@first_name} #{@last_name}"
		@age = data[:age]
		@state_of_residence = data[:state_of_residence]
		@spending_money = data[:spending_money]
		@game_interests = []
	end

	def out_of_state?
		@state_of_residence != 'CO'
	end

	def add_game_interest(game)
		@game_interests << game.name
	end
end