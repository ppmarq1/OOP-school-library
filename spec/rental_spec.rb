require './rental'
require './student'
require './teacher'
require './book'

describe Rental do
  before :each do
    @person = Student.new nil, 58, 'Pedro', parent_permission: true
    @book = Book.new 'The power of now', 'Eckart Toole'
    @rental = Rental.new '03/08/2022', @person, @book
  end

  it 'it should show the rented books title' do
    @person.rentals.each do |rental|
      expect(rental.book.title).to eq 'The power of now'
    end
  end
  it 'it should show the name of person to rent' do
    @person.rentals.each do |rental|
      expect(rental.person.name).to eq 'Pedro'
    end
  end
  it 'it should show the date of rental' do
    @person.rentals.each do |rental|
      expect(rental.date).to eq '03/08/2022'
    end
  end
end
