class Player

  DEFAULT_HP = 20
  DEFAULT_HIT = 10

  attr_reader :name, :hit_points

  def initialize(name, hit_points=DEFAULT_HP)
    @name = name
    @hit_points = hit_points
  end

  def been_hit(damage = DEFAULT_HIT)
    @hit_points -= damage
  end

  def dead?
    @hit_points <= 0
  end

end
