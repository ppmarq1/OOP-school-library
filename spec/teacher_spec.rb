require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new 'Science', 45, 'Joka', true
  end

  it 'it should returns a teacher object' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'it should show the person age' do
    expect(@teacher.age).to eq 45
  end

  it 'it should show the teacher name' do
    expect(@teacher.name).to eq 'Joka'
  end

  it 'it should return true if person age is less than 18 otherwise return true' do
    expect(@teacher.can_use_services?).to be true
  end
end
