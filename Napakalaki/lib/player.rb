# encoding: UTF-8
# Autora: Minim

require_relative 'bad_consequence.rb'

module NapakalakiGame

class Player
  
  attr_reader :name, :level, :dead, :hiddenTreasures, :visibleTreasures
  
  @@MAXLEVEL=10
  
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
    nLevels = m.levels
    incrementLevels(nLevels)
    nTreasures = m.treasures
    
    if(nTreasures>0)
      dealer = CardDealer.instance
      for i in 0...nPrize
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end
  end
  
  def applyBadConsequence(m)
      badConsequence = m.clone
      nLevels = badConsequence.levels
      decrementLevels(nLevels)
    
      pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad) 
  end
  
  def canMakeTreasureVisible(t)
    can = false
    #si tenemos el tesoro es de tipo una mano y ya hay dos manos o dos una mano, no se puede  
    if(t.type == TreasureKind::ONEHAND)
      if((@visibleTreasures.detect {|v| v.type == TreasureKind::BOTHHANDS}) == nil)
        if((@visibleTreasures.count {|v| v.type == TreasureKind::ONEHAND}) < 2)
          can = true
        end
      end
      #si es dos manos y hay algun tesoro de tipo manos, entonces no se puede
      elsif(t.type == TreasureKind::BOTHHANDS) 
        if((@visibleTreasures.detect {|v| v.type == TreasureKind::BOTHHANDS}) == nil)
          if((@visibleTreasures.detect {|v| v.type == TreasureKind::ONEHAND}) == nil)
            can = true
          end
        end
      else #en otro caso, se puede solo si no se encuentran tesoros de ese tipo
        if((@visibleTreasures.detect {|v| v.type == t.type}) == nil)
          can = true
        end
      end
  
    can
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
    myLevel = @level
    monsterLevel = m.level
    if(myLevel>monsterLevel)
      applyPrize(m)
      if(myLevel>=@@MAXLEVEL)
        combatResult=CombatResult::WINGAME
      else
        combatResult=CombatResult::WIN
      end
    else
      applyBadConsequence(m)
      combatResult=CombatResult::LOSE
    end
    dealer = CardDealer.instance
    dealer.giveMonsterBack(m)
    combatResult
  end
  
  def makeTreasureVisible(t)
    canI = canMakeTreasureVisible(t)
      
    if(canI)
      @visibleTreasures << t
      @hiddenTreasures.delete(t)
    end
    
    canI
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.delete(t)
    
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
    
    if(@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    
    dieIfNoTreasures
  end
  
  def discardHiddenTreasure(t)
    @hiddenTreasures.delete(t)
    
    if(@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
    dieIfNoTreasures
  end
  
  def validState
     if(@pendingBadConsequence.isEmpty && @hiddenTreasures.size < 4)
       true
     else
       false
     end
  end
  
  def initTreasures
    dealer = CardDealer.instance
    dice = Dice.instance
    bringToLive
    
    treasure = dealer.nextNumber
    @hiddenTreasures << treasure
    
    dice.nextNumber
    #Obtenciones en el dado (number)
    if (number > 1)
      max = 1
      treasure = dealer.nextNumber
      @hiddenTreasures << treasure
    end
    if(number == 6) 
      treasure = dealer.nextNumber
      @hiddenTreasures << treasure
    end
  end
  
  def discardAllTreasures
    numVisibles = @visibleTreasures.size
    numOcultos = @hiddenTreasures.size
    for i in 0...numVisibles
      discardVisibleTreasure(@visibleTreasures[i])
    end
    for i in 0...numOcultos
      discardHiddenTreasure(@hiddenTreasures[i])
    end
  end
  
  def self.MAXLEVEL
    @@MAXLEVEL
  end
  
end

end
