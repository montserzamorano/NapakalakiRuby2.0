# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class Monster
  attr_reader :name, :combatLevel, :prize, :badConsequence
  
  #EXAMEN
  @@contadorMonstruos = 0
  #EXAMEN
  
  def initialize(name, level, bc, prize, lC=0)
    @name = name
    @combatLevel = level
    @badConsequence = bc
    @prize = prize
    @@contadorMonstruos += 1
    @levelChangeAgainstCultistPlayer = lC
  end
  
  public 
  #to string
  def to_s
    "\nCARTA DE MONSTRUO \nNombre: #{@name}\nNivel de combate: #{@combatLevel}
\nMal rollo: " + @badConsequence.to_s + "\nPremio: " + @prize.to_s
  end
  
  def getLevelsGained
    @prize.levels
  end
  
  def getTreasuresGained
    @prize.treasures
  end
  
  def getName
    @name
  end
  
  def getCombatLevel
    @combatLevel
  end
  
  def getBadConsequence
    @badConsequence
  end
  
  def getPrize
    @prize
  end
  
  def getCombatLevelAgainstCultistPlayer
    getCombatLevel + @levelChangeAgainstCultistPlayer
  end
  
  #EXAMEN
  def self.getNumberOfMonsters()
    @@contadorMonstruos
  end
  #EXAMEN
  
end

end