# encoding: UTF-8
# Autora: Minim

require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
require_relative 'monster.rb'
require_relative 'player.rb'
require_relative 'numeric_bad_consequence.rb'
require_relative 'death_bad_consequence.rb'
require_relative 'specific_bad_consequence.rb'
require_relative 'cultist_player.rb'

module NapakalakiGame

class Napakalaki
  
  attr_reader :currentPlayer, :currentMonster
  @@MAXJUGADORES = 3
  @@instance = nil
  
  def initialize
    @currentPlayerIndex = nil
    @currentPlayer = nil
    @currentMonster = nil
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
    if(names.size > @@MAXJUGADORES)
      puts "Demasiados jugadores"
    else
      names.each do |n|
        @players << Player.new(n)
      end
    end
  end
  
  def nextPlayer
    if(@currentPlayerIndex == nil)
      @currentPlayerIndex = rand(@players.size)
    else
      if(@currentPlayerIndex == @players.size-1)
        @currentPlayerIndex = 0
      else
        @currentPlayerIndex += 1
      end
    end
    
    @currentPlayer = @players[@currentPlayerIndex]
    @currentPlayer #return
    
  end
  
  def nextTurnAllowed
    if(@currentPlayer == nil)
      return true
    else
      return @currentPlayer.validState
    end
  end
  
  public
  
  def developCombat
      combatResult = @currentPlayer.combat(@currentMonster)
      dealer = CardDealer.instance
      dealer.giveMonsterBack(@currentMonster)
      if(combatResult == CombatResult::LOSEANDCONVERT)
        c = dealer.nextCultist
        @currentPlayer = CultistPlayer.new(@currentPlayer, c)
        @players[@currentPlayerIndex] = @currentPlayer
      end
      combatResult
  end
  
  def discardVisibleTreasures(treasures)
    treasures.each do |t|
      @currentPlayer.discardVisibleTreasure(t)
    end
  end
  
  def discardHiddenTreasures(treasures)
    treasures.each do |t|
      @currentPlayer.discardHiddenTreasure(t)
    end
  end
  
  def makeTreasuresVisible(treasures)
    treasures.each do |t|
      @currentPlayer.makeTreasureVisible(t)
    end
  end
  
  def initGame(players)
    dealer = CardDealer.instance
    dealer.initCards
    initPlayers(players)
    nextTurn
  end
  
  def getCurrentPlayer
    @currentPlayer
  end
  
  def getCurrentMonster
    @currentMonster
  end
  
  def nextTurn
      stateOK = nextTurnAllowed
    
      if(stateOK)
        dealer = CardDealer.instance
        @currentMonster = dealer.nextMonster
        @currentPlayer = nextPlayer
      
        dead = @currentPlayer.isDead
      
        if(dead)
          @currentPlayer.initTreasures
        end
      end
    
      stateOK
  end
  
  def endOfGame(result)
    if(result == CombatResult::WINGAME)
      return true
    else
      return false
    end
  end
  
end

end