require './trimmer_decorator'
require './person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new 43, 'silvamarques'
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  it 'it should slice if string is more than 10 char' do
    expect(@trimmer_decorator.correct_name.length).to be <= 10
  end
end
