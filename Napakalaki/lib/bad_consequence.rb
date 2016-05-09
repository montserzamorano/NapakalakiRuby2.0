# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class BadConsequence

  @@MAXTREASURES = 10
  
  def initialize(aText, someLevels)
    @text = aText
    @levels = someLevels
  end
  
  public
  
  def getText
    @text
  end
  
  def getLevels
    @levels
  end
  
  def self.MAXTREASURES
    @@MAXTREASURES
  end
  
end

end
