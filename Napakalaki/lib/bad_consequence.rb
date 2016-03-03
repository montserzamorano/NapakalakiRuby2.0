# encoding: UTF-8
# Autora: Minim

class BadConsequence
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures
  
  #Contructores
  def initialize(text, levels, nVisible, nHidden)
    @text = text
    @levels = levels
    @nVisibleTreasures = nVisible
    @nHiddenTreasures = nHidden
    @specificVisibleTreasures = Array.new
    @specificHiddenTreasures = Array.new
  end
  
  def initialize(text)
    @text = text
    @levels = 10
    @nVisibleTreasures = 10
    @nHiddenTreasures = 10
    @specificVisibleTreasures = Array.new
    @specificHiddenTreasures = Array.new
  end
  
  def initialize(text, levels, tVisible, tHidden)
    @text = text
    @levels = levels
    @nVisibleTreasures = 0
    @nHiddenTreasures = 0
    
    if(tVisible != nil)
      tVisible.each do |t|
        @specificVisibleTreasures << t
      end
    end
    
    if(tHidden != nil)
      tHidden.each do |t|
        @specificHiddenTreasures << t
      end
    end
    
  end
end
