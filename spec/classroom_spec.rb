require './classroom'
require './student'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Grade 45'
    @student = Student.new 'Grade 45', 58, 'Pedro'
  end

  it 'it should returns a Classroom object' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'it should show the classroom label' do
    expect(@classroom.label).to eq 'Grade 45'
  end

  it 'it should show the classroom label' do
    expect(@classroom.students.length).to eq 0
  end

  it 'it should show the classroom label' do
    @classroom.add_student @student
    expect(@classroom.students.length).to eq 2
  end
end
