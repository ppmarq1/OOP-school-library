# rubocop:disable Metrics

require './app'

def menu(option, myapp)
  case option

  when '1'

    myapp.list_books

    message_menu myapp

  when '2'

    myapp.list_people

    message_menu myapp

  when '3'

    myapp.add_person

    message_menu myapp

  when '4'

    myapp.add_book

    message_menu myapp

  when '5'

    myapp.add_rental

    message_menu myapp

  when '6'

    myapp.list_rentals_by_person_id

    message_menu myapp

  when '7'

    puts 'Thank you for using the School Library App!'

  else

    puts 'Please enter a number between 1 and 7'

  end
end

def run
  puts 'Welcome To School Library App!'

  puts

  puts
end

