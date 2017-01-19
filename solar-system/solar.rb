
class System

  def initialize
    @bodies = []
  end

  attr_reader(:bodies)

  def add(body)
    @bodies << body
  end

  def total_mass
    @total_mass = 0
    @bodies.each {|body| @total_mass += body.mass}
    puts @total_mass
  end

end

class Body

  def initialize(name, mass)
    @name = name
    @mass = mass
  end

  attr_reader(:mass,:name)

end

class Planet < Body
  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end
end

class Star < Body
  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end
end


class Moon < Body
  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
  end

  attr_reader(:planet)
end
