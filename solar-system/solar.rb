
class System

  def initialize
    @bodies = []
    # @@systems = []
    # @@mass = 0
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
  end

  def total_mass
    @total_mass = 0
    @bodies.each {|body| @total_mass += body.mass}
    puts @total_mass
  end

  # def self.mass(system)
  #   @@systems.each do |system|
  #     @@mass += system.mass
  #   end
  # end

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
