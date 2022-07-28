require './app'

def main
  app = App.new

  app.run
end

def actions
  puts ''

  puts 'Welcome to School Library App!'

  puts ''

  puts 'Please choose an option by entering a number:'

  puts

  {

    1 => 'List all books',

    2 => 'List all people',

    3 => 'Create a person',

    4 => 'Create a book',

    5 => 'Create a rental',

    6 => 'List all rentals for a given person id',

    7 => 'Exit'

  }
end

def action(action)
  action_list = { 1 => 'list_books', 2 => 'list_people', 3 => 'add_person', 4 => 'add_book', 5 => 'add_rental',

                  6 => 'list_rentals_by_person_id', 7 => 'exit' }

  if action_list.key?(action)

    send(action_list[action])

  else

    puts 'Invalid input!'

  end

  run
end

main
