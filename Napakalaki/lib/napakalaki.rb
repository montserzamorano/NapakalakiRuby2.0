# encoding: UTF-8
# Autora: Minim

class Napakalaki
  
  attr_reader :currentPlayer, :currentMonster
  
  @@instance = nil
  
  def initialize
    @currentPlayerIndex = -1
    @currentPlayer
    @currentMonster
    @players = Array.new
  end
  
  def self.instance
    if(@@instance==nil)
      @@instance = new
    end
    @@instance
  end

  private_class_method :new
  
  private
  
  def initPlayers(names)
  end
  
  def nextPlayer
  end
  
  def nextTurnAllowed
  end
  
  public
  
  def developCombat
  end
  
  def discardVisibleTreasures(treasures)
  end
  
  def discardHiddenTreasures(treasures)
  end
  
  def makeTreasuresVisible(treasures)
  end
  
  def initGame(players)
  end
  
  def getCurrentPlayer
  end
  
  def getCurrentMonster
  end
  
  def nextTurn
  end
  
  def endOfGame
  end
  
end