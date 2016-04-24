# To # encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class Treasure
  
  attr_reader :name, :bonus, :type 
  
  def initialize(n,bonus,t)
    @name = n
    @bonus = bonus
    @type = t
  end
  
  def to_s
    "#{@name}\n Bonus: #{@bonus}\n Tipo: #{@type}"
  end
  
end

end