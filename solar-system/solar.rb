
class System

  def initialize
    @bodies = []
    @total_mass = 0
    @@universe_mass = []
    @@super_mass = 0
  end

  attr_reader(:bodies)

  def add(new_body)
    @bodies.each do |body|
      if new_body.name == body.name
        puts "sorry name taken"
        return
      end
    end
    @bodies << new_body
    @@universe_mass << new_body.mass
  end

  def total_mass
    @bodies.each {|body| @total_mass += body.mass}
    puts @total_mass
  end

  def self.super_mass
    @@universe_mass.each {|body_mass| @@super_mass += body_mass}
    puts @@super_mass
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
    @@planets = []
  end

  def self.all(system)
    system.bodies.each do |body|
      if body.class == Planet
        @@planets << body
      end
    end
    return @@planets
  end
end

class Star < Body
  def initialize(name, mass, type)
    super(name, mass)
    @type = type
    @@stars = []
  end

  def self.all(system)
    system.bodies.each do |body|
      if body.class == Star
        @@stars << body
      end
    end
    return @@stars
  end
end


class Moon < Body
  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
    @@moons = []
  end

  attr_reader(:planet)

  def self.all(system)
    system.bodies.each do |body|
      if body.class == Moon
        @@moons << body
      end
    end
    return @@moons
  end
end

# $j = System.new
# $m = System.new
#
# $earth = Planet.new("earth",1,1,1)
# $moon = Moon.new("moon", 1, 1, $earth)
#
# $j.add($earth)
# $j.add($moon)
#
# $pluto = Planet.new("pluto",2,1,1)
# $plutmoon = Moon.new("plutmoon", 2, 1, $pluto)
#
# $m.add($pluto)
# $m.add($plutmoon)
