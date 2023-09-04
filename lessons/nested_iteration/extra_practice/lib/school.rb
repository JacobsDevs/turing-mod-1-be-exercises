class School
  attr_reader :name, :groups, :courses

  def initialize(name, groups)
    @name = name
    @groups = groups
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def assign_to_group(student)
    student.group = @groups.sample
  end

	def group_all_students
	  courses.map {|course| course.students}.flatten.uniq.each {|student| assign_to_group(student)}
	end
	
	def names
	  courses.map {|course| course.students}.flatten.uniq.map {|student| student.name}
	end

	def students_by_group
	  courses.inject(Hash.new {|h, k| h[k] = []}) do |hash, course|
		  course.students.each do |student|
				hash[student.group] << student if !hash[student.group].include?(student)
			end
			hash
		end
	end
end
