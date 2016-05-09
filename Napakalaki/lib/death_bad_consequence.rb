# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class DeathBadConsequence < NumericBadConsequence
  def initialize(aText)
    super(aText,Player.MAXLEVEL,@@MAXTREASURES,@@MAXTREASURES)
  end
  
  def adjustToFitTreasureLists(visible,hidden)
    DeathBadConsequence.new(@text)
  end
  
  
  def to_s
    super
  end
  
end

end