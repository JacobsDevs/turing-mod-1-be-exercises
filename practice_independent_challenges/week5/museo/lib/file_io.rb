require 'csv'

class FileIo
  def initialize
	end

	def read_csv(path)
	  data = CSV.foreach(path, headers: true, header_converters: :symbol).map(&:to_h)
	end
end