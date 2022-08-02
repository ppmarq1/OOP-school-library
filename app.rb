require './person'

require './capitalize_decorator'

require './trimmer_decorator'

require './student'

require './classroom'

require './teacher'

require './rental'

require './book'

require './data/data_abstraction'

class App
  def initialize
    @people = []

    @books = []

    @rentals = []
  end

  def list_books
    puts 'There are no books to show! Please add a book.' if @books.empty?

    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }

    puts

    puts
  end

  def list_people
    puts 'There are no people to show! Please add a student or a teacher.' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}" }

    puts

    puts
  end

  def add_person
    print 'Do you want to create a student (1) or teacher (2)? [Input the number]: '

    choice = gets.chomp

    case choice

    when '1'

      create_student

    when '2'

      create_teacher

    else

      puts 'Invalid input! Please enter 1 or 2'

    end
  end

  def create_student
    print 'Age: '

    age = gets.chomp.to_i

    print 'Name: '

    name = gets.chomp

    print 'Has parent permission? [Y/N]: '

    permission = gets.chomp.downcase

    parent_permission = permission == 'y'

    classroom = 'Grade 45'

    student = Student.new(classroom, age, name, parent_permission)

    @people << student

    save_student(classroom, age, name, parent_permission)

    puts 'Person/Student created successfully'

    puts

    puts
  end

  def create_teacher
    print 'Age: '

    age = gets.chomp.to_i

    print 'Name: '

    name = gets.chomp

    print 'Specialization: '

    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)

    @people << teacher

    save_teacher(specialization, age, name)

    puts 'Person/Teacher created successfully'

    puts

    puts
  end

  def add_book
    print 'Title: '

    title = gets.chomp

    print 'Author: '

    author = gets.chomp

    book = Book.new(title, author)

    @books << book

    save_book(title, author)

    puts 'Book created successfully'

    puts

    puts
  end

  def add_rental
    puts 'Please select a book from the following list by number'

    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Please select a person from the following list by number (not id)'

    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '

    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])

    @rentals << rental

    save_rental(date, person_id, book_id)

    puts 'Rental created successfully'

    puts

    puts
  end

  def list_rentals_by_person_id
    print 'ID of person: '

    id = gets.chomp.to_i

    puts 'Rentals:'

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end

    puts

    puts
  end

  def load_preserve_data
    load_people @people

    load_books @books

    load_rentals @rentals
  end

  # def show_data

  #   p @people

  #   p @books

  #   p @rentals

  # end
end
