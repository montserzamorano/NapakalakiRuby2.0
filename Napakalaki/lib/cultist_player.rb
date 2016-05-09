#encoding: utf-8

module NapakalakiGame


  class CultistPlayer < Player
    @@totalCultistPlayer = 0
    def initialize(p,c)
      newPlayer(p)
      @myCultistCard = c
      @@totalCultistPlayer +=1
    end
    
    protected
    
    def getCombatLevel
      (1.5*super + @myCultistCard.getGainedLevels*@@totalCultistPlayer).to_i
    end
    
    def self.getTotalCultistPlayer
      @@totalCultistPlayer
    end
    
   protected
    
    def getOponentLevel(m)
      m.getCombatLevelAgainstCultistPlayer
    end
    
    def shouldConvert
      false
    end
    
    
    def to_s
      "#{getName} (sectario) \n  Nivel = #{getLevel} \n  Nivel de combate = #{getCombatLevel} \n"
    end
    
  end

end