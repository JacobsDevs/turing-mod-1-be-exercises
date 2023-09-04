require 'csv'

class FileIo
	def initialize
	end

	def open_data(path)
	  reader = CSV.read(path, headers: true)
	end
end