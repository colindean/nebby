class Nebby::Question
  attr_accessor :title, :type, :code, :options
  attr_accessor :expected_answer, :validations

  def initialize title
    @title = title
  end

end
