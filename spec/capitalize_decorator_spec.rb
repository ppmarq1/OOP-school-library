require '../capitalize_decorator'
require './person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new 43, 'silvamarques'
    @capitalize = CapitalizeDecorator.new(@person)
  end
  it 'it should CAPS person name' do
    expect(@capitalize.correct_name).to eq 'SILVAMARQUES'
  end
end
