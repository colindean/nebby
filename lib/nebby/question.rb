require 'digest/md5'

class Nebby::Question
  attr_accessor :title, :type, :code, :options, :option_max
  attr_accessor :expected_answer, :validations

  def initialize title
    @title = title
    @type = :short_answer
    @code = Digest::MD5.hexdigest(Random.srand.to_s)[0..7] #this may be stupid?
    @options = {}
    @option_max = 1
    @expected_answer = nil
    @validations = []
  end

  def process_options_block &block
    instance_eval &block
  end

  def choose_one opts
    option_max = 1
    options = opts
  end

  def choose_many opts
    option_max = -1
    options = opts
  end

  def expected_answer answer, options
    @expected_answer = answer
    if options.member? :case_sensitive
      if options[:case_insensitive]
        validations
      end
    end
  end

  #http://www.clemson.edu/centers-institutes/tourism/documents/sample-scales.pdf
  def likert number
    options = number
    type = :option
    five = {  "Strongly disagree" => 1, 
              "Disagree" => 2, 
              "Neither agree nor disagree" => 3, 
              "Agree" => 4, 
              "Strongly agree" => 5 }
    choose_one five
  end

  def numeric
    #validate that answer is a number
  end

end
