require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @decoration.correct_name.upcase
  end
end
