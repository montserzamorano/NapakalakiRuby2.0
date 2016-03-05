# encoding: UTF-8
# Autora: Minim

class BadConsequence
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
  someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    
    @specificVisibleTreasures = Array.new
    if(!someSpecificVisibleTreasures.nil?)
      someSpecificVisibleTreasures.each do |t|
        @specificVisibleTreasures << t
      end
    end
    
    @specificHiddenTreasures = Array.new
    if(!someSpecificHiddenTreasures.nil?)
      someSpecificHiddenTreasures.each do |t|
        @specificHiddenTreasures << t
      end
    end
  end
  
  #Contructores
  def BadConsequence.newLevelNumberOfTreasures(text, levels, nVisible, nHidden)
    new(text,levels,nVisible,nHidden,Array.new, Array.new)
  end
  
  def BadConsequence.newDeath(text)
    new(text,10,10,10, Array.new, Array.new)
  end
  
  def BadConsequence.newLevelSpecificTreasures(text, levels, tVisible, tHidden)
    new(text,levels,0,0,tVisible,tHidden)
  end
  
  private_class_method :new
  
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
        elsif(treasure == TreasureKind::SHOES)
          texto << "\tCalzado\n"  
        end
      end
    end # Fin de unless
  end
  
  #to string
  def t_s
    texto = "#{@text}\nNiveles perdidos: #{@levels}"
    if @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
      texto += "\nTesoros visibles perdidos: #{@nVisibleTreasures} 
      \nTesoros ocultos perdidos: #{@nHiddenTreasures}"
    elsif !@specificVisibleTreasures.empty? || !@specificHiddenTreasures.empty?
      if !@specificVisibleTreasures.empty?
        texto += "\nTesoros visibles especificos: \n" 
        imprimirTesoros(@specificVisibleTreasures, texto)
      end
      if !@specificHiddenTreasures.empty?
        texto += "\nTesoros ocultos especificos: \n" 
        imprimirTesoros(@specificHiddenTreasures, texto)
      end
    end
    texto
  end
  
end
