# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class BadConsequence
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures
  
  @@MAXTREASURES = 10
  
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
    new(text,Player.MAXLEVEL,@@MAXTREASURES,@@MAXTREASURES, Array.new, Array.new)
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
  
  public
  
  def self.MAXTREASURES
    @@MAXTREASURES
  end
  
  def copiar(b)
    @text = ""
    @levels = b.levels
    @nVisibleTreasures = b.nVisibleTreasures
    @nHiddenTreasures = b.nHiddenTreasures
    b.specificVisibleTreasures.each do |t|
      @specificVisibleTreasures << t
    end
    b.specificHiddenTreasures.each do |t|
      @specificHiddenTreasures << t
    end
    
  end
  
  def isEmpty
    if(@nVisibleTreasures==0 && @nHiddenTreasures == 0 && 
          @specificVisibleTreasures.size == 0 && @specificHiddenTreasures.size == 0)
      return true
    else
      return false
    end
  end
  
  def getLevels
  end
  
  def getNVisibleTreasures
  end
  
  def getNHiddenTreasures
  end
  
  def getSpecificHiddenTreasures
  end
  
  def getSpecificVisibleTreasures
  end
  
  def substractVisibleTreasure(t)
    if(!@specificVisibleTreasures.empty?)
      @specificVisibleTreasures.delete(t.type)
    else #si en el mal rollo no hay tesoros especificos, se reducen los tesoros visibles
      if(nVisibleTreasures > 0)
        @nVisibleTreasures-=1
      end
    end
    #devolver la carta descartada al mazo
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
  end
  
  def substractHiddenTreasure(t)
    if(!@specificHiddenTreasures.empty?)
      @specificHiddenTreasures.delete(t.type)
    else #si en el mal rollo no hay tesoros especificos, se reducen los tesoros visibles
      if(nHiddenTreasures > 0)
        @nHiddenTreasures-=1
      end
    end
    #devolver la carta descartada al mazo
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
  end
  
  def adjustToFitTreasureLists(v,h)
     if((@nVisibleTreasures != 0) || (@nHiddenTreasures != 0)) 
        if(@nVisibleTreasures > v.size)
          nVisible = v.size
        else
          nVisible = @nVisibleTreasures 
        end
        
        if(@nHiddenTreasures > h.size)
          nHidden = h.size
        else
          nHidden = @nHiddenTreasures 
        end
         
        bc = BadConsequenceSpecific.new(@text, @levels, nVisible, nHidden)
      else 
        vTreasures = Array.new
        hTreasures = Array.new
     
        @specificVisibleTreasures.each do |visible|
          if((v.detect {|vis| vis.type == visible}) != nil)
            vTreasures << visible
          end
        end
      
        @specificHiddenTreasures.each do |hidden|
          if((h.detect {|oculto| oculto.type == hidden}) != nil)
            hTreasures << hidden
          end
        end
      
        bc = BadConsequenceSpecific.new(@text, @levels, vTreasures, 
          hTreasures)
      end
      
      bc
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

end
