# encoding: UTF-8
# Autora: Minim

class Prize
  #Consultores
  attr_reader :treasures, :levels
  
  #Constructor
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end
  
  #to string
  def t_s
    "Tesoros ganados: #{@treasures}\n Niveles ganados: #{@levels}"
  end
end
