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
end
