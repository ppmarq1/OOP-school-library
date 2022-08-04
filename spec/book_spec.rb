require './book'

describe Book do
  before :each do
    @book = Book.new 'The power of now', 'Eckart Toole'
  end

  it 'takes two parameters and returns a Book object' do
    expect(@book).to be_instance_of Book
  end

  it 'should show the book title' do
    expect(@book.title).to eq 'The power of now'
  end

  it 'should show the book author' do
    expect(@book.author).to eq 'Eckart Toole'
  end
end
