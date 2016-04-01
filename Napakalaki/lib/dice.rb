# encoding: UTF-8
# Autora: Minim

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
  end
  
end
