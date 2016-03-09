# encoding: UTF-8
# Autora: Minim

require_relative "cards.rb"

class EjemploMain
  def self.main
    #Mostrar monstruos que tienen un nivel de combate superior a 10
    Cards.newMonsters
    m = Cards.monstruos
    #Tengan un mal rollo que implique solo perdida de niveles
#    m.each do |mons|
#      mal = mons.bc
#      if mal.levels!=0 && mal.nHiddenTreasures==0 && mal.nVisibleTreasures==0 && 
#          mal.specificHiddenTreasures.empty? && mal.specificVisibleTreasures.empty?
#          puts mons.t_s
#      end
#    end

    #Su buen rollo indique una ganancia de niveles superior a 1
   # m.each do |mons|
   #   p = mons.prize
   #   if p.levels>1
   #       puts mons.t_s
   #   end
   # end
    #Su mal rollo suponga la perdida de un determinado tipo de tesoros
    m.each do |mons|
      mal = mons.bc
      (mal.specificVisibleTreasures).each do |s|
        if s == TreasureKind::ARMOR
          puts mons.t_s
        end
      end
    end
  end
end
if $0 == __FILE__
  EjemploMain.main()
end