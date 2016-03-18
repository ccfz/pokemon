
class Attack

  def self.commence(player)
    Attack.new(player).attack
  end

  def initialize(player)
    @player = player
  end

  def attack
    @player.been_hit(damage)
  end

  private

    def damage
      Kernel.rand(5..10)
    end
end
