# encoding: UTF-8
# Autora: Minim

class BadConsequence
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
  someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    if (someSpecificVisibleTreasures.empty?) && (someSpecificHiddenTreasures.empty?)
      if (someLevels == 0) && (someVisibleTreasures == 0) &&
      (someHiddenTreasures == 0)
        BadConsequence.newDeath(aText)
      else
        BadConsequence.newLevelNumberOfTreasures(aText, someLevels,
        someVisibleTreasures, someHiddenTreasures)
      end
    else
      BadConsequence.newLevelSpecificTreasures(aText, someLevels,
      someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    end
  end
  #Contructores
  def BadConsequence.newLevelNumberOfTreasures(text, levels, nVisible, nHidden)
    @text = text
    @levels = levels
    @nVisibleTreasures = nVisible
    @nHiddenTreasures = nHidden
    @specificVisibleTreasures = Array.new
    @specificHiddenTreasures = Array.new
  end
  
  def BadConsequence.newDeath(text)
    @text = text
    @levels = 10
    @nVisibleTreasures = 10
    @nHiddenTreasures = 10
    @specificVisibleTreasures = Array.new
    @specificHiddenTreasures = Array.new
  end
  
  def BadConsequence.newLevelSpecificTreasures(text, levels, tVisible, tHidden)
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
  pritave_class_method :new
  
  def imprimirTesoros(treasures, texto)
    unless treasures.empty?
      treasures.each do |treasure|
        if(treasure == TreasureKind::ONEHAND)
          texto << "\tMano\n"
        elsif(treasure == TreasureKind::ARMOR)
          texto << "\tArmadura \n"
        elsif(treasure == TreasureKind::BOTHHANDS)
          texto << "\tDos manos\n" 
        elsif(treasure == TreasureKind::HELMET)
          texto << "\tCasco\n"  
        elsif(treasure == TreasureKind::SHOE)
          texto << "\tCalzado\n"  
        end
      end
    end # Fin de unless
  end
  
  #to string
  def t_s
    texto = "#{@text}\n Niveles perdidos: #{@levels}"
    if @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
      texto += "\n Tesoros visibles perdidos: #{@nVisibleTreasures} 
      \n Tesoros ocultos perdidos: #{@nHiddenTreasures}"
    else
      texto += "\n Tesoros visibles especificos: " 
      imprimirTesoros(@specificVisibleTreasures, texto)
      texto += "\Tesoros ocultos especificos: " 
      imprimirTesoros(@specificHiddenTreasures, texto)
    end
    texto
  end
  
end
