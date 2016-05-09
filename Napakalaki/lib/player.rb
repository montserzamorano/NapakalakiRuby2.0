# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class Player
  
  attr_reader :name, :level, :dead, :hiddenTreasures, :visibleTreasures, :pendingBadConsequence
  
  @@MAXLEVEL=10
  
  def initialize(name)
    @dead = true
    @name = name
    @level = 1
    @hiddenTreasures = Array.new
    @visibleTreasures = Array.new
    @pendingBadConsequence = NumericBadConsequence.new(" ", 0, Array.new, Array.new)
  end
  
  #constructor de copia
  def newPlayer(p)
    @dead = p.dead
    @name = p.name
    @level = p.level
    @hiddenTreasures = p.hiddenTreasures
    @visibleTreasures = p.visibleTreasures
    @pendingBadConsequence = p.pendingBadConsequence
  end
  
  private
  
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
    @pendingBadConsequence = b #mirar
  end
  
  def applyPrize(m)
    nLevels = m.getLevelsGained
    incrementLevels(nLevels)
    nTreasures = m.getTreasuresGained
    
    if(nTreasures>0)
      dealer = CardDealer.instance
      for i in 0...nTreasures
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end
  end
  
  def applyBadConsequence(m)
    badConsequence = (m.getBadConsequence).clone
      nLevels = badConsequence.getLevels
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
  
  
  public
  
  def isDead
    @dead
  end
  
  def combat(m)
    myLevel = getCombatLevel
    monsterLevel = getOponentLevel(m)
    if(myLevel > monsterLevel)
      applyPrize(m)
      if(myLevel>=@@MAXLEVEL)
        combatResult=CombatResult::WINGAME
      else
        combatResult=CombatResult::WIN
      end
    else
      cultist=shouldConvert
      applyBadConsequence(m)
      if(cultist)
        combatResult=CombatResult::LOSEANDCONVERT
      else
        combatResult=CombatResult::LOSE
      end
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
          
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
    
    if(@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
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
    bringToLife
    
    treasure = dealer.nextTreasure
    @hiddenTreasures << treasure
    
    number = dice.nextNumber
    if (number > 1)
      max = 1
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
    end
    if(number == 6) 
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
    end
  end
  
  def discardAllTreasures
    c1 = @visibleTreasures.clone
    c2 = @hiddenTreasures.clone
    
    c1.each do |v|
      discardVisibleTreasure(v)
    end
    c2.each do |h|
      discardHiddenTreasure(h)
    end
    #@visibleTreasures.clear
    #@hiddenTreasures.clear
    #@pendingBadConsequence.vaciar
    #dieIfNoTreasures
  end
  
  def self.MAXLEVEL
    @@MAXLEVEL
  end
  
  
  def getHiddenTreasures
    @hiddenTreasures
  end
  
  def getVisibleTreasures
    @visibleTreasures
  end

  def getLevels
    @level
  end
  
  def getName
    @name
  end
  
  
  def to_s
    "Name #{@name.to_s} and level #{@level.to_s}"
  end
  
  #EXAMEN
  
  def setHiddenTreasures(tesorosOcultos)
    @hiddenTreasures = tesorosOcultos.clone
    
  end
  
  def setVisibleTreasures(tesorosVisibles)
    @visibleTreasures = tesorosVisibles.clone
    
  end
  
  #EXAMEN
  
  protected
  
    def getCombatLevel
      combatLevel=@level
      @visibleTreasures.each do |v|
        combatLevel += v.bonus
      end
      combatLevel
  end
  
    def getOponentLevel(m)
      m.getCombatLevel
    end
    
    def shouldConvert
      dice = Dice.instance
      return (dice.nextNumber == 6)
    end
    
    
end

end
