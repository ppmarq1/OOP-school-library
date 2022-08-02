require 'json'
require './person'
require './student'
require './classroom'
require './teacher'
require './rental'
require './book'

def load_people(mypeople)
  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if File.empty?('./data/people.json')
      mypeople << []
    else
      people = JSON.parse(File.read('./data/people.json'))
      # p people.length()
      people.each do |person|
        # p person
        mypeople << if person['type'] == 'Student'
                      Student.new(person['classroom'], person['age'], person['name'], person['parent_permission'])
                    else
                      Teacher.new(person['specialization'], person['age'], person['name'], person['parent_permission'])
                    end
      end
    end
    file.close
  else
    mypeople << []
  end
end

def load_books(mybook)
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      mybook << []
    else
      books = JSON.parse(File.read('./data/books.json'))

      books.each do |book|
        mybook << Book.new(book['title'], book['author'])
      end
    end
    file.close
  else
    mybook << []
  end
end

def load_rentals(myrental)
  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if file.size.zero?
      myrental << []
    else
      rentals = JSON.parse(File.read('./data/rentals.json'))

      rentals.each do |rental|
        myrental << Rental.new(rental['date'], @people[rental['person']], @books[rental['book']])
      end
    end
    file.close
  else
    myrental << []
  end
end

def save_student(classroom, age, name, parent_permission)
  obj = {
    type: 'Student',
    classroom: classroom,
    name: name,
    age: age,
    parent_permission: parent_permission
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      student = [obj]
    else
      student = JSON.parse(File.read('./data/people.json'))
      student << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(student))
    myfile.close
  end
end

def save_teacher(specialization, age, name)
  obj = {
    type: 'Teacher',
    specialization: specialization,
    name: name,
    age: age,
    parent_permission: true
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      teacher = [obj]
    else
      teacher = JSON.parse(File.read('./data/people.json'))
      teacher << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(teacher))
    myfile.close
  end
end

def save_book(title, author)
  obj = {
    title: title,
    author: author
  }

  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      book = [obj]
    else
      book = JSON.parse(File.read('./data/books.json'))
      book << obj
    end

    file.close

    myfile = File.open('./data/books.json', 'w')
    myfile.write(JSON.pretty_generate(book))
    myfile.close
  end
end

def save_rental(date, person_id, book_id)
  obj = {
    date: date,
    person: person_id,
    book: book_id
  }

  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if file.size.zero?
      rental = [obj]
    else
      rental = JSON.parse(File.read('./data/rentals.json'))
      rental << obj
    end

    file.close

    myfile = File.open('./data/rentals.json', 'w')
    myfile.write(JSON.pretty_generate(rental))
    myfile.close
  end
end
