require './lib/file_io'
require './lib/photograph'

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

	def photographs_from_country(country)
		artists_and_photographs.select {|artist, photos| artist if artist.country == country}.values.flatten
	end

	def build_photographs(path)
	  file_io = FileIo.new
		file_io.read_csv(path).each do |photo_data|
			add_photograph(Photograph.new(photo_data))
		end
	end

	def build_artists(path)
	  file_io = FileIo.new
		file_io.read_csv(path).each do |artist_data|
			add_artist(Artist.new(artist_data))
		end
	end
end