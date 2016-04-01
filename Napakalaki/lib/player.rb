# encoding: UTF-8
# Autora: Minim

class Player
  
  attr_reader :name, :level, :dead, :hiddenTreasures, :visibleTreasures 
  
  MAXLEVEL=10
  
  def initialize(name)
    @dead = true
    @name = name
    @level = 1
    @hiddenTreasures = Array.new
    @visibleTreasures = Array.new
    @pendingBadConsequence
  end
  
  private
  
  def bringToLife
  end
  
  def incrementLevels(l)
  end
  
  def decrementLevels(l)
  end
  
  def setPendingBadConsequence(b)
  end
  
  def applyPrize(m)
  end
  
  def applyBadConsequence(m)
  end
  
  def canMakeTreasureVisible(t)
  end
  
  def howManyVisibleTreasures(tKind)
  end
  
  def dieIfNoTreasures
  end
  
  def isDead
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
  end
  
  def initTreasures
  end
  
  def discardAllTreasures
  end
  
end
