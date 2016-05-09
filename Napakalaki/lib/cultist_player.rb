#encoding: utf-8

module NapakalakiGame


  class CultistPlayer < Player
    @@totalCultistPlayer = 0
    def initialize(p,c)
      newPlayer(p)
      @myCultistCard = c
      @@totalCultistPlayer +=1
    end
    
    #protected
    #es protected CUIDADO
    public
    def getCombatLevel
      (1.5*super + @myCultistCard.getGainedLevels*@@totalCultistPlayer).to_i
    end
    
    protected
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
    
    public
    
    def to_s
      "Jugador sectario: " + super + "\n" + " Nivel de combate = #{getCombatLevel} \n Con carta de sectario " + @myCultistCard.to_s
    end
    
  end

end