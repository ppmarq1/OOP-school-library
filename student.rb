# rubocop: disable Style/OptionalBooleanParameter
require './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end
end

# rubocop: enable Style/OptionalBooleanParameter
