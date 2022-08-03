require './trimmer_decorator'
require './capitalize_decorator'
require './person'

describe Decorator do
  before :each do
    @person = Person.new 43, 'silvamarques'
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmer_decorator = TrimmerDecorator.new(@capitalize)
  end

  it 'it should display correct name' do
    expect(@person.correct_name).to eq 'silvamarques'
  end

  it 'it should CAPS person name' do
    expect(@capitalize.correct_name).to eq 'SILVAMARQUES'
  end

  it 'it should slice if string is more than 10 char' do
    expect(@trimmer_decorator.correct_name).to eq 'SILVAMARQU'
    expect(@trimmer_decorator.correct_name.length).to be <= 10
  end
end
