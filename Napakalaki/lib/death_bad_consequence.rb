# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class DeathBadConsequence < NumericBadConsequence
  def initialize(aText)
    super(aText,Player.MAXLEVEL,@@MAXTREASURES,@@MAXTREASURES)
  end
  
  def adjustToFitTreasureLists(visible,hidden)
    super(visible,hidden)
  end
  
  def to_s
    super
  end
  
end

end