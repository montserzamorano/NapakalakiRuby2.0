# encoding: UTF-8
# Autora: Minim
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

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
    \n Mal rollo: #{@bc} \n Premio: #{@prize}"
  end
end
