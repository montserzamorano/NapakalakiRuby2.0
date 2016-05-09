# encoding: UTF-8
# Autora: Minim

module NapakalakiGame

class SpecificBadConsequence < BadConsequence 
  def initialize(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    super(aText, someLevels)
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
  
  #solo tiene sentido en esta clase
  
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
  
  def isEmpty
    if(@specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?)
      true
    else
      false
    end
  end
  
  def getSpecificHiddenTreasures
    @specificHiddenTreasures
  end
  
  def getSpecificVisibleTreasures
    @specificVisibleTreasures
  end
  
  
  def substractVisibleTreasure(t)
    if(!@specificVisibleTreasures.empty?)
      @specificVisibleTreasures.delete(t.type)
    end
    #devolver la carta descartada al mazo
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
  end
  
  def substractHiddenTreasure(t)
    if(!@specificHiddenTreasures.empty?)
      @specificHiddenTreasures.delete(t.type)
    end
    #devolver la carta descartada al mazo
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
  end
  
  #adjust to fit
  
  def adjustToFitTreasureLists(visible, hidden)
    cvisible = Array.new
    cvisible.replace(visible)
    chidden = Array.new
    chidden.replace(hidden)
    newSpecificVisibleTreasures = Array.new
    newSpecificHiddenTreasures = Array.new
     
    if (@specificVisibleTreasures.length != 0 && @specificHiddenTreasures.length == 0) #Caso en el que el mal rollo quita tesoros especificos.
      @specificVisibleTreasures.each do |tk|
        i = 0
        found = false
                
        while(i < cvisible.length && !found)
          if (cvisible.at(i).getType == tk)
            found = true    
          else
            i = i + 1
          end
        end
                
        if (found)
          newSpecificVisibleTreasures << tk
          cvisible.delete_at(i)
        end
      end
    elsif (@specificVisibleTreasures.length == 0 && @specificHiddenTreasures.length != 0) 
      @specificHiddenTreasures.each do |tk|
        i = 0
        found = false
                
        while(i < chidden.length && !found)
          if (chidden.at(i).getType == tk)
            found = true     
          else
            i = i + 1
          end
        end
                
        if (found)
          newSpecificHiddenTreasures << tk
          chidden.delete_at(i)
        end
      end 
    elsif (@specificVisibleTreasures.length != 0 && @specificHiddenTreasures.length != 0)  
      @specificVisibleTreasures.each do |tk|
        i = 0
        found = false
                
        while(i < cvisible.length && !found)
          if (cvisible.at(i).getType == tk)
            found = true      
          else
            i = i + 1
          end
        end
                
        if (found)
          newSpecificVisibleTreasures << tk
          cvisible.delete_at(i)
        end
      end
        
      @specificHiddenTreasures.each do |tk|
        i = 0
        found = false
                
        while(i < chidden.length && !found)
          if (chidden.at(i).getType == tk)
              found = true      
            else
              i = i + 1
            end
          end
                
          if (found)
            newSpecificHiddenTreasures << tk
            chidden.delete_at(i)
          end
        end
      end
        
      SpecificBadConsequence.new(@text,0,newSpecificVisibleTreasures,newSpecificHiddenTreasures)
    end
  
  
  #to string
  
  def to_s
    texto = super
      if !@specificVisibleTreasures.empty?
        texto += "\nTesoros visibles especificos perdidos: \n" 
        imprimirTesoros(@specificVisibleTreasures, texto)
      end
      if !@specificHiddenTreasures.empty?
        texto += "\nTesoros ocultos especificos perdidos: \n" 
        imprimirTesoros(@specificHiddenTreasures, texto)
      end
    texto
  end
  
end

end