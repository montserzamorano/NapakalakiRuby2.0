# To # encoding: UTF-8
# Autora: Minim

class Treasure
  
  attr_reader :name, :bonus, :type 
  
  def initialize(n,bonus,t)
    @name = n
    @bonus = bonus
    @type = t
  end
end
