# rubocop: disable Style/OptionalBooleanParameter
require './nameable'

class Person < Nameable
  attr_reader :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
  end

  attr_accessor :name, :age

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age < 18
  end
end

# rubocop: enable Style/OptionalBooleanParameter
