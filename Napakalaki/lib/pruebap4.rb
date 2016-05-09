# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.



module NapakalakiGame
  require_relative "prize.rb"
  require_relative "monster.rb"
  require_relative "treasure_kind.rb"
  require_relative "bad_consequence.rb"
  require_relative "dice.rb"
  require_relative "treasure.rb"
  require_relative "card_dealer.rb"
  require_relative "player.rb"
  require_relative "napakalaki.rb"
  require_relative "combat_result.rb"
  require_relative "GameTester"
  require_relative "cultist.rb"
  require_relative "cultist_player.rb"
  
  class Pruebap4
    @@numveces=0
    
    def initialize 

    end
    
    def run
      p1 = Player.new("p1")
      p2 = Player.new("p2")
      
      
      v1 = Array.new
      h1 = Array.new
  
      v1 << Treasure.new("Tesoro",3,TreasureKind::ONEHAND)
      v1 << Treasure.new("Tesoro",3,TreasureKind::HELMET)
      v1 << Treasure.new("Tesoro",3,TreasureKind::ARMOR)
      
      h1 << Treasure.new("Tesoro",3,TreasureKind::ARMOR)
      h1 << Treasure.new("Tesoro",3,TreasureKind::SHOES)
      h1 << Treasure.new("Tesoro",3,TreasureKind::HELMET)
      
      p1.setVisibleTreasures(v1)
      p1.setHiddenTreasures(h1)
      
      p2.setVisibleTreasures(v1)
      p2.setHiddenTreasures(h1)
  
      puts "Estado del jugador 1"
      puts p1.to_s
      
      puts "Estado del jugador 2"
      puts p2.to_s
      
      cultist = Cultist.new("Sectario",1)
  
      p3 = CultistPlayer.new(p1,cultist)
      
      puts "El jugador 1 se ha convertido en sectario"
      puts p3.to_s
      
      cultist2 = Cultist.new("Sectario",2)
      
      p4 = CultistPlayer.new(p2,cultist2)
      
      puts "El jugador 2 se ha converitod en sectario"
      puts p4.to_s
      
      puts "Nivel de combate del jugador sectario 1 \n"
      puts p3.getCombatLevel
      
      puts "Nivel de combate del jugador sectario 2 \n"
      puts p4.getCombatLevel
      
      v2 = Array.new
      h2 = Array.new
      
      p3.setVisibleTreasures(v2)
      p3.setHiddenTreasures(h2)
      
      p4.setVisibleTreasures(v2)
      p4.setHiddenTreasures(h2)
      
      puts "Estado del jugador 1 en sectario modificado \n"
      puts p3.to_s
      
      puts "Estado del jugador 2 en sectario modificado \n"
      puts p4.to_s
      
      puts "PARTE B"
      #PARTE B

      bc = NumericBadConsequence.new("number",0,4,0)

      puts "bc sin ajustar \n"
      puts bc.to_s
      
      bc1 = bc.adjustToFitTreasureLists(v1,h1)
      
      puts "bc ajustado \n"
      puts bc1.to_s
      
      vis = Array.new
      hid = Array.new
  
      vis << TreasureKind::ONEHAND
      vis << TreasureKind::ONEHAND
      vis << TreasureKind::BOTHHANDS   

      bc2 = SpecificBadConsequence.new("specific",0,vis,hid)
      
      puts "bc sin ajustar \n"
      puts bc2.to_s
      

      bc3 = bc2.adjustToFitTreasureLists(v1,h1)

      puts "bc ajustado \n"
      puts bc3.to_s

      
      bc_d = DeathBadConsequence.new("muerte")
      
      puts "bc sin ajustar \n"
      puts bc_d.to_s
      
      bc4 = bc_d.adjustToFitTreasureLists(v1,h1)
      
      puts "bc ajustado \n"
      puts bc4.to_s
    end
    
    def self.getNumVeces
      @@numveces
    end
  end

  p = Pruebap4.new
  
  p.run
  
  puts Pruebap4.getNumVeces
end
