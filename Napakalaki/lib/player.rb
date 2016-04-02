# encoding: UTF-8
# Autora: Minim

require_relative 'bad_consequence.rb'

module NapakalakiGame

class Player
  
  attr_reader :name, :level, :dead, :hiddenTreasures, :visibleTreasures
  
  MAXLEVEL=10
  
  def initialize(name)
    @dead = true
    @name = name
    @level = 1
    @hiddenTreasures = Array.new
    @visibleTreasures = Array.new
    @pendingBadConsequence = BadConsequence.newLevelSpecificTreasures(" ", 0, Array.new, Array.new)
  end
  
  private
  
  def getCombatLevel
    combatLevel=@level
    @visibleTreasures.each do |v|
      combatLevel += v.bonus
    end
    return combatLevel
  end
  
  def bringToLife
    @dead = false
    @level = 1
  end
  
  def incrementLevels(l)
    @level += l
  end
  
  def decrementLevels(l)
    @level -= l
    if(level < 1)
      @level = 1
    end
  end
  
  def setPendingBadConsequence(b)
    @pendingBadConsequence.copiar(b)
  end
  
  def applyPrize(m)
  end
  
  def applyBadConsequence(m)
  end
  
  def canMakeTreasureVisible(t)
  end
  
  def howManyVisibleTreasures(tKind)
    contador=0
    @visibleTreasures.each do |v|
      if(v.type == tKind)
        contador+=1
      end
    end
    contador
  end
  
  def dieIfNoTreasures
    if(@hiddenTreasures.size == 0 && @visibleTreasures.size == 0)
      @dead = true
    end
  end
  
  def isDead
    @dead
  end
  
  public
  
  def combat(m)
  end
  
  def makeTreasureVisible(t)
  end
  
  def discardVisibleTreasure(t)
  end
  
  def discardHiddenTreasure(t)
  end
  
  def validState
     if(@pendingBadConsequence.isEmpty && @hiddenTreasures.size < 4)
       true
     else
       false
     end
  end
  
  def initTreasures
  end
  
  def discardAllTreasures
  end
  
  def self.MAXLEVELS
    10
  end
  
end

end