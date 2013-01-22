#!/usr/bin/env ruby
#require 'nebby'

class NebbyExample < Nebby::Survey; end

class NebbyExample

  admin do 
    password "thisismypassword" #this is the password which will be used to access the admin tool
    use_google_charts true #set this to false if you don't want google to see your data!
  end
  
  anonymous #expect no identifying information
  #synonym:
  #survey_option :anonymous, true
  
  languages ['en','es'] #limit the languages, identifiable by browser language
  #synonym:
  #survey_option, :languages, ['en','es]
  #or
  #language "en"
  #language "es"
  
  paging :single
  #paging :individual
  #paging 7 # split questions into seven groups automatically, or use influences in questions
  

  #set start and end date
  starting "2012-03-12"
  ending "2012-12-21"

  ask "Who are you?" do
    type :short_answer #the type of the question
    code "who" #a short code for dealing with it
  end
  
  ask "What is your quest?" do
    type :long_answer, {:limit => 1000} #paragraph, 1000 character limit
    code "quest" #the short code is used instead of the full question when recording, unique key
    
  end
  
  ask "What is the airspeed velocity of an unladen swallow?" do
    type :shortanswer
    code "swallow"
    expected_answer "African or European", {:case_sensitive => false} #One True Answer question
  end
  
  ask "What of these do you prefer?" do
    type :option
    code "fruit"
    choose_one ["Apples","Oranges","Pineapples","Kiwis"] #choose_one uses radios
  end
    
  ask "Check those whom you like." do
    type :option
    code "knights"
    choose_many ["Arthur","Lancelot","Bedevere","Galahad","Robin","Not-appearing-in-this-survey"]
    #choose_many uses checkboxen
  end
  
  ask "Are these options mapped to something else?" do
    type :option
    code "mapped"
    choose_one [ "Totally" => "yes", "Negative" => "no" ]
  end
  
  ask "Do you agree with this question?" do
    type :likert, 5 
    #short for 
    #type :option
    #choose_one {"Strongly disagree" => 1, "Disagree" => 2, "Neither agree nor disagree" => 3, "Agree" => 4, "Strongly agree" => 5}
    code :agree
  end
  
  ask "What is your salary?" do
    type :short_answer
    numeric #only numbers are allowed
  end 
  
  ask "What is your email address?" do
    type :email #automatic setup of validations
  end
  
  ask "What is your postal address?" do
    type :post_address #expands into multiple 'questions' somehow
    #automatic validation of postcode via country
  end
  
  ask "What is your phone number?" do
    type :phone #automatic validation
  end
  
  ask "May we add you do our mailing list?" do
    type :yesno
    #short for choose_one ['Yes','No']
  end
  
  ask "Please add me to your mailing list." do
    type :optout #default checked
    #type :optin #default unchecked
    #short for putting a checkbox next to a line for an optout
  end
  
  optout "Don't ever contact me again" #shorthands available
  optin "I really mean it."
  email "What is your other email address?"
  phone "What is your phone number at work?"
  #just about every type will have a shorthand available, no code or custom validation when using shorthand
  
end

#serve up the survey standalone
Nebby::Server.serve NebbyExample
