require 'csv'
require 'pry'

class Name
	attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
	@@filename = 'Popular_Baby_Names.csv'

	def initialize(data)
		@year = data["Year of Birth"]
		@bio_gender = data["Gender"]
		@ethnicity = data["Ethnicity"]
		@name = data["Child's First Name"]
		@count = data["Count"]
		@rank = data["Rank"]
	end

	def self.find_by_name(name)
		rows = CSV.read(@@filename, headers: true)
		result = []
    rows.each do |row|
			new_name = Name.new(row)
			result << new_name if new_name.name == name
		end
		result
	end

	def self.find_by_rank(rank)
		rows = CSV.read(@@filename, headers: true)
		result = []
		rows.each do |row|
			new_name = Name.new(row)
			result << new_name if new_name.rank == rank
		end
		result
	end
end

puts Name.find_by_name("MEGAN").count
Name.find_by_rank("1").each do |name|
	puts name.name
end