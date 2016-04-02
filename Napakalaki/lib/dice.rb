# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class Dice
  def initialize 
  end
  
  @@instance = nil
  
  def initialize 
  end
  
  public
  
  def self.instance
    if(@@instance==nil)
      @@instance = new
    end
    @@instance
  end

  private_class_method :new
  
  def nextNumber
    numAleatorio = rand(6) +1
    return numAleatorio
  end
  
end

end