
class System

  attr_reader(:bodies)

  def add(body)
    @bodies << body
  end

  def total_mass
    @bodies.each do |body|
      @mass += @body_mass
    end
    @mass =  @total_mass
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
