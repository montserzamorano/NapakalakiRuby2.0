# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class Prize
  #Consultores
  attr_reader :treasures, :levels
  
  #Constructor
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end
  
  def getTreasures
    @treasures
  end
  
  def getLevels
    @levels
  end
  
  #to string
  def to_s
    "Tesoros ganados: #{@treasures}\n Niveles ganados: #{@levels}"
  end
end

end