# encoding: UTF-8
# Autora: Minim
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

class Monster
  attr_reader :name, :combatLevel, :prize, :badConsequence
  def initialize(name, level, bc, prize)
    @name = name
    @level = level
    @badConsequence = bc
    @prize = prize
  end
  
  #to string
  def t_s
    "\nCARTA DE MONSTRUO \nNombre: #{@name}\nNivel de combate: #{@level}
\nMal rollo:" + @bc.t_s + "\nPremio: " + @prize.t_s
  end
end
