require 'csv'

class FileIo
  def initialize
	end

	def read_artist_csv(path)
	  CSV.readlines(path, headers: true)
	end
end