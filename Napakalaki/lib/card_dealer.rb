# encoding: UTF-8
# Autora: Minim

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
  end
  
  def initMonsterCardDeck
  end
  
  def shuffleTreasures
  end
  
  def shuffleMonsters
  end
  
  public
  
  def nextTreasure
  end
  
  def nextMonster
  end
  
  def giveTreasureBack
  end
  
  def giveMonsterBack
  end
  
  def initCards
  end
  
end

end