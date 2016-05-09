# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  require_relative 'napakalaki.rb'
  require_relative 'prize.rb'
  require_relative 'monster.rb'
  require_relative 'treasure_kind.rb'
  require_relative 'bad_consequence.rb'
  require_relative 'dice.rb'
  require_relative 'treasure.rb'
  require_relative 'card_dealer.rb'
  require_relative 'player.rb'
  require_relative 'combat_result.rb'
  require_relative 'GameTester.rb'
  
  class EjemploMain
   
      def prueba
        
       test = Test::GameTester.instance
     
       game = Napakalaki.instance
   
       #Se prueba el juego con 2 jugadores
   
       test.play(game, 2);
       
      end
      
  end
  
    e = EjemploMain.new
    e.prueba()

end
