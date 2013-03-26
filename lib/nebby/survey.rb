require 'singleton'
class Nebby::Survey
  include Singleton

  attr_accessor :questions, :paging, :languages, :admin_options, :survey_options
  attr_accessor :starting, :ending

  def initialize
    @questions = []
    @admin_options = Nebby::AdminOptions.new
    @survey_options = {}
    @languages = []
  end

  def add_question question
    questions << question
  end

  def add_admin_option option
    admin_options << option
  end

  def add_survey_option option, value
    survey_options[option] = value
  end

  def has_language? language
    languages.member? language
  end

  def self.anonymous
    self.instance.add_survey_option :anonymous, true
  end

  def self.paging number
    self.instance.add_survey_option :paging, number
  end

  def self.starting date
    self.instance.add_survey_option :starting, date
  end

  def self.ending date
    self.instance.add_survey_option :ending, date
  end

  def self.languages langs
    languages = langs
  end

  def self.ask title, &block
    q = Nebby::Question.new title
    q.process_options_block &block
    self.instance.add_question q
  end

  def self.admin &block
    self.instance.process_options_block &block
  end

  def process_options_block &block
      @admin_options.instance_eval &block
  end






end
