class Nebby::Survey
  attr_accessor :questions, :paging, :languages, :admin_options
  attr_accessor :starting, :ending

  def initialize
  end

  def add_question question
    questions << question
  end

  def add_admin_option option
    admin_options << option
  end

  def has_language? language
    languages.member? language
  end

end
