require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @decoration.correct_name.upcase[0...10]
  end
end
