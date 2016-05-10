# encoding: UTF-8
# Autora: Minim

class Cultist
  def initialize(name, gainedLevels)
    @name = name
    @gainedLevels = gainedLevels
  end
  
  public 
  
  def getGainedLevels
    @gainedLevels
  end
  
  def to_s
      "Nombre: #{@name} Niveles ganados: #{@gainedLevels}"
  end
end
