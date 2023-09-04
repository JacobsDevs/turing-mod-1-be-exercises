class Curator
	attr_reader :artists,
							:photographs
	def initialize
	  @artists = []
		@photographs = []
	end

	def add_photograph(photograph)
	  @photographs << photograph
	end

	def add_artist(artist)
	  @artists << artist
	end

	def find_artist_by_id(id)
	  @artists.find {|artist| artist.id == id}
	end

	def artists_and_photographs
	  artists_with_photographs = Hash.new {|h, k| h[k] = []}
		@artists.each do |artist|
			artists_with_photographs[artist] += artist_photographs(artist)
		end
		artists_with_photographs
	end

	def artist_photographs(artist)
		@photographs.select {|photo| photo.artist_id == artist.id}
	end

	def artists_with_multiple_photographs
	  artists_and_photographs.select {|artist, photos| artist if photos.length > 1}.keys
	end
end