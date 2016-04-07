# encoding: UTF-8

require_relative 'referee.rb'
require_relative 'monster.rb'
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'treasure_kind.rb'

module NapakalakiGame

#module P2 ESTO NO ESTA BIEN HECHO
  
class P2
  def initialize
  end
  
  def self.examen
    local = Referee.instance
    puts local.judge(-1)
    puts local.judge(3)
    puts local.judge(7)
    
    #crear monstruos
    
    #3 byakhees de bonanza
    bc = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible"+ 
    "y otra oculta", 0,[TreasureKind::ARMOR], [TreasureKind::ARMOR])
    p = Prize.new(2,1)
    Monster.new("3 byakhees de bonanza", 8, bc, p)
    
    #Chibithulhu
    bc = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo" +
    " primigenio te descartas de tu casco visible",0,[TreasureKind::HELMET], 
    Array.new)
    p = Prize.new(1,1)
    Monster.new("Chibithulhu", 2, bc, p)
    
    #El sopor de Dunwich
    bc = BadConsequence.newLevelSpecificTreasures("El primordial bostezo " + 
    "contagioso. Pierdes el calzado visible.", 0,[TreasureKind::SHOES], 
    Array.new)
    p = Prize.new(1,1)
    Monster.new("El sopor de Dunwich", 2, bc, p)
    
    puts Monster.getNumberOfMonsters
    
  end
  
end

#end

end
