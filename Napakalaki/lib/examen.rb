# encoding: UTF-8

require_relative 'player.rb'
require_relative 'treasure.rb'
require_relative 'treasure_kind.rb'
require_relative 'monster.rb'
module NapakalakiGame

class Examen
  def initialize  
  end
  
  def run
    #Pregunta 2
    jugador1 = Player.new("Jugador 1")
    
    tesorosOcultos = Array.new
    
    tesorosOcultos << Treasure.new("¡Si,mi amo!",4, TreasureKind::ONEHAND)
    tesorosOcultos << Treasure.new("Botas de investigacion",3, TreasureKind::HELMET)
    tesorosOcultos << Treasure.new("Capucha de Cthulhu",3, TreasureKind::BOTHHANDS)
    tesorosOcultos << Treasure.new("A prueba de babas",2, TreasureKind::SHOES)
    tesorosOcultos << Treasure.new("Botas de lluvia acida",1, TreasureKind::ONEHAND)
    tesorosOcultos << Treasure.new("Casco minero",2, TreasureKind::HELMET)
    
    jugador1.setHiddenTreasures(tesorosOcultos)
    tesorosOcultos2 = tesorosOcultos.clone
    
    tesorosOcultos2.each do |t|
      puts "----------------------------"
      jugador1.makeTreasureVisible(t)
      puts "VISIBLES"
      puts jugador1.getVisibleTreasures
      puts "OCULTOS"
      puts jugador1.getHiddenTreasures
      puts "----------------------------"
    end
    
    puts "NIVEL DE COMBATE"
    puts jugador1.getCombatLevel
    
    
    #pregunta 3
    jugador2  = Player.new("Jugador 2")
    tesorosVisibles = Array.new
    
    tesorosVisibles << Treasure.new("¡Si,mi amo!",0, TreasureKind::ONEHAND)
    tesorosVisibles << Treasure.new("Botas de investigacion",0, TreasureKind::HELMET)
    jugador2.setVisibleTreasures(tesorosVisibles)
    
    tesorosOcultos = Array.new
    tesorosOcultos << Treasure.new("¡Si,mi amo!",0, TreasureKind::BOTHHANDS)
    tesorosOcultos << Treasure.new("Botas de investigacion",0, TreasureKind::ARMOR)
    tesorosOcultos << Treasure.new("Capucha de Cthulhu",0, TreasureKind::SHOES)
    
    jugador2.setHiddenTreasures(tesorosOcultos)
    
    monstruos = Array.new
    
    bc = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta"+ 
    "cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3,
    [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],
    Array.new)
    p = Prize.new(1,1)
    monstruos << Monster.new("Bicefalo", 20, bc, p)
    
    bc = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y " + 
    "2 tesoros ocultos",2,0,2)
    p = Prize.new(2,1)
    monstruos << Monster.new("Semillas Cthulhu", 4, bc, p)
    
    
    monstruos.each do |m|
      puts jugador2.combat(m)
      puts "Estado"
      jugador2.getLevels
      puts jugador2.pendingBadConsequence
    end
    
    
end

end

end