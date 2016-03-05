# encoding: UTF-8
# Autora: Minim

require_relative "cards.rb"

class EjemploMain
  def self.main
    #Mostrar monstruos que tienen un nivel de combate superior a 10
    Cards.newMonsters
    m = Cards.monstruos
    m.each do |mons|
      puts mons.t_s
    end
    #Tengan un mal rollo que implique solo perdida de niveles
    #Su mal rollo indique una ganancia de niveles superior a 1
    #Su mal rollo suponga la perdida de un determinado tipo de tesoros
  end
end
if $0 == __FILE__
  EjemploMain.main()
end