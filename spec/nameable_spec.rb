require './person'

describe Nameable do
  before :each do
    @person = Person.new 43, 'silvamarques'
  end

  it 'Should display correct name' do
    expect(@person.correct_name).to eq 'silvamarques'
  end
end
