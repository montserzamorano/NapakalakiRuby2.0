# encoding: UTF-8
# Autora: Minim

require_relative 'cards.rb'
require_relative 'treasure_kind.rb'

module NapakalakiGame

class CardDealer
  def initialize   
  end
  
  @@instance = nil
  
  def initialize
    @unusedMonsters = Array.new
    @usedMonsters = Array.new
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
  end
  
  def self.instance
    if(@@instance==nil)
      @@instance = new
    end
    @@instance
  end

  private_class_method :new
  
  private
  
  def initTreasureCardDeck
    Cards.newTreasures
    @unusedTreasures = Cards.treasures
  end
  
  def initMonsterCardDeck
    Cards.newMonsters
    @unusedMonsters = Cards.monstruos
  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle!
  end
  
  def shuffleMonsters
    @unusedMonsters.shuffle!
  end
  
  public
  
  def nextTreasure
    
      if (@unusedTreasures.empty?)
        @unusedTreasures = @usedTreasures.clone
        @usedTreasures.clear
        
        shuffleTreasures
      end
      
      t = @unusedTreasures[0]
      @unusedTreasures.delete_at(0)
      @usedTreasures << t
       
      t
    
  end
  
  def nextMonster
      if (@unusedMonsters.empty?)
        @unusedMonsters = @usedMonsters.clone
        @usedMonsters.clear
        
        shuffleMonsters
      end
      
      m = @unusedMonsters[0]
      @unusedMonsters.delete_at(0)
      @usedMonsters << m
      
      m
  end
  
  def giveTreasureBack(t)
    @unusedTreasures.delete(t)
    @usedTreasures << t
  end
  
  def giveMonsterBack(m)
    @unusedMonsters.delete(m)
    @usedMonsters << m
  end
  
  def initCards
    initTreasureCardDeck
    initMonsterCardDeck
    shuffleMonsters
    shuffleTreasures
  end
  
end

end