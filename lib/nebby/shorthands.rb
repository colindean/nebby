module Nebby::Survey::Shorthands

  def optout text=nil

  end

  def optin text=nil

  end

  def email text=nil

  end

  def phone text=nil

  end

end

class Nebby::Survey
  include  Nebby::Survey::Shorthands
end
