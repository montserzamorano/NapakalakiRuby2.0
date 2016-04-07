# encoding: UTF-8
# Autora: Minim
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

module NapakalakiGame

class Monster
  attr_reader :name, :combatLevel, :prize, :badConsequence
  
  #EXAMEN
  @@contadorMonstruos = 0
  #EXAMEN
  
  def initialize(name, level, bc, prize)
    @name = name
    @level = level
    @badConsequence = bc
    @prize = prize
    @@contadorMonstruos += 1
  end
  
  public 
  #to string
  def t_s
    "\nCARTA DE MONSTRUO \nNombre: #{@name}\nNivel de combate: #{@level}
\nMal rollo:" + @badConsequence.t_s + "\nPremio: " + @prize.t_s
  end
  
  def getLevelsGained
    @prize.levels
  end
  
  def getTreasuresGained
    @prize.treasures
  end
  
  #EXAMEN
  def self.getNumberOfMonsters()
    @@contadorMonstruos
  end
  #EXAMEN
  
end

end