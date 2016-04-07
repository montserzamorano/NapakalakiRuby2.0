#encoding: utf-8

#EXAMEN

require_relative 'dice.rb'

module NapakalakiGame
  class Referee
    def initialize(name)
      @name = name
    end
  
    @@instance = nil
  
    public
  
    def self.instance
      if(@@instance==nil)
        @@instance = new("examen")
      end
      @@instance
    end

    private_class_method :new
    
    def getName
      @name
    end
    
    def judge(i)
      dado = Dice.instance
      numero = dado.nextNumber
      #puts "Resultado dado: " + numero.to_s
      if(numero<i)
        true
      else
        false
      end
    end
    
  end
end

#EXAMEN