# encoding: UTF-8
# Autora: Minim

class Monster
  attr_reader :name, :combatLevel, :prize, :bc
  def initialize(name, level, bc, prize)
    @name = name
    @level = level
    @bc = bc
    @prize = prize
  end
end
