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
  
  #to string
  def t_s
    "CARTA DE MONSTRUO \n Nombre: #{@name}\n Nivel de combate: #{@level}
    \n Mall rollo: #{@bc} \n Premio: #{@prize}"
  end
end
