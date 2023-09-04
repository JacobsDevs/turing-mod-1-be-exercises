class WorldCup
  attr_reader :year, :teams

	def initialize(year, teams)
		@year = year
		@teams = teams
	end
	
	def active_players_by_position(position)
	  teams.map {|team| team.players.select {|player| player if player.position == position} if !team.eliminated?}.flatten.compact
	end

	def all_players_by_position
	  teams.inject(Hash.new {|h, v| h[v] = []}) do |hash, team|
			team.players.each do |player|
        hash[player.position] << player
			end
			hash
		end
	end
end