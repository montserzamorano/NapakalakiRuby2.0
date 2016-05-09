# encoding: UTF-8
# Autora: Minim


module NapakalakiGame

class NumericBadConsequence < BadConsequence
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    super(aText, someLevels)
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
  end
  
  def getNVisibleTreasures
    @nVisibleTreasures
  end
  
  def getNHiddenTreasures
    @nHiddenTreasures
  end
  
  def substractVisibleTreasure(t)
    @nVisibleTreasures-=1
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
  end
  
  def substractVisibleTreasure(t)
    @nHiddenTreasures-=1
    dealer = CardDealer.instance
    dealer.giveTreasureBack(t)
  end
  
  def isEmpty
    if(@nVisibleTreasures == 0 && @nHiddenTreasures == 0)
      true
    else
      false
    end
  end
  
  def adjustToFitTreasureLists(visible,hidden)
      if (@nVisibleTreasures == 0)
        nVisible = 0
      else
        if (@nVisibleTreasures < visible.length)
          nVisible = @nVisibleTreasures
        else
          nVisible = visible.length
        end
      end

      if (@nHiddenTreasures == 0)
        nHidden = 0
      else
        if (@nHiddenTreasures < hidden.length)        
          nHidden = @nHiddenTreasures
        else
          nHidden = hidden.length
        end
      end

      NumericBadConsequence.new(@text,0,nVisible,nHidden)
    end
  #to string
  def to_s
    super + "\nTesoros visibles perdidos: #{@nVisibleTreasures} \nTesoros ocultos perdidos: #{@nHiddenTreasures}"
  end
  
end
end