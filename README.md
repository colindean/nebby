Nebby
=====

Nebby is a domain-specific language for describing surveys.

Nebby provides a quick, Ruby-throated way to construct a survey and present
the results in an easy-to-understand and easy-to-share way.

Requirements
------------

* Ruby 1.9+
* Sinatra
* MongoDB

Examples
--------

See example.rb.

N.b. that I have yet to actually write any code for processing this example.

Goals
-----

The primary goal is to get this working as a standalone web site. The workflow
would be something like this:

 1. `gem install bundler` duh
 2. `gem install nebby` duh
 3. `nebby init my_survey` creates a nebby installation in directory my\_survey
 4. edit my\_survey.rb to your heart's desire
 5. deploy to heroku or duostack or the like
 6. share link to survey
 7. see results
 8. ???
 9. profit

Eventually, nebby should be useable as a gem with a sinatra or rails
application. sinatra integration is foremost, as standalone nebby will use
sinatra. rails is secondary because it will need to meet the robust needs of
rails clientele.
