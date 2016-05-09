# encoding: UTF-8
# Autora: Minim

require_relative 'numeric_bad_consequence.rb'
require_relative 'death_bad_consequence.rb'
require_relative 'specific_bad_consequence.rb'
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
require_relative 'monster.rb'

module NapakalakiGame

class Cards
  @@max = 10
  def self.newMonsters
    @@monstruos = Array.new
    #3 byakhees de bonanza
    bc = SpecificBadConsequence.new("Pierdes tu armadura visible "+ 
    "y otra oculta", 0,[TreasureKind::ARMOR], [TreasureKind::ARMOR])
    p = Prize.new(2,1)
    @@monstruos << Monster.new("3 byakhees de bonanza", 8, bc, p)
    
    #Chibithulhu
    bc = SpecificBadConsequence.new("Embobados con el lindo" +
    " primigenio te descartas de tu casco visible",0,[TreasureKind::HELMET], 
    Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Chibithulhu", 2, bc, p)
    
    #El sopor de Dunwich
    bc = SpecificBadConsequence.new("El primordial bostezo " + 
    "contagioso. Pierdes el calzado visible.", 0,[TreasureKind::SHOES], 
    Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("El sopor de Dunwich", 2, bc, p)
    
    #Angeles de la noche ibicenca
    bc = SpecificBadConsequence.new("Te atrapan para llevarte " +
    "de fiesta y te dejan caer en mitad del vuelo. Descarte 1 mano visible y" +
    " 1 mano oculta.",0,[TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    p = Prize.new(4,1)
    @@monstruos << Monster.new("Angeles de la noche ibicenca", 14, bc, p)
    
    #El gorron en el umbral
    bc = NumericBadConsequence.new("Pierdes todos tus tesoros"+ 
    "visibles", 0, @@max,0)
    p = Prize.new(3,1)
    @@monstruos << Monster.new("El gorron en el umbral", 10, bc, p)
    
    #HP Munchcraft
    bc = SpecificBadConsequence.new("Pierdes la armadura visible",
    0,[TreasureKind::ARMOR], Array.new)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("HP Munchcraft", 6, bc, p)
    
    #Bichgooth
    bc = SpecificBadConsequence.new("Sientes bichos bajo la ropa."+ 
    "Descarta la armadura visible.",0, [TreasureKind::ARMOR], Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Bichgooth", 2, bc, p)
    
    #El rey de rosa
    bc = NumericBadConsequence.new("Pierdes 5 niveles y "+
    "3 tesoros visibles",5,3,0)
    p = Prize.new(4,2)
    @@monstruos << Monster.new("El rey de rosa", 13, bc, p)
   
    #La que redacta en las tinieblas
    bc = NumericBadConsequence.new("Toses los pulmones y " + 
    "pierdes dos niveles",2,0,0)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("La que redacta en las tinieblas", 2, bc, p)
    
    #Los hondos
    bc = DeathBadConsequence.new("Estos monstruos resultan bastante superficiales " +
    "aburren mortalmente. Estas muerto.")
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Los hondos", 8, bc, p)
    
    #Semillas Cthulhu
    bc = NumericBadConsequence.new("Pierdes 2 niveles y " + 
    "2 tesoros ocultos",2,0,2)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Semillas Cthulhu", 4, bc, p)
    
    #Dameargo
    bc = SpecificBadConsequence.new("Te intentas escaquear." +
    "Pierdes una mano visible",0,[TreasureKind::ONEHAND], Array.new)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Dameargo", 1, bc, p)
    
    #Pollipolipo volante
    bc = NumericBadConsequence.new("Da mucho asquito. Pierdes"+ 
    " 3 niveles", 3, 0,0)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Pollipolipo volante", 3, bc, p)
    
    #Yskhtihyssg-Goth
    bc = DeathBadConsequence.new("No le hace gracia que pronuncien mal su " +
    "nombre. Estas muerto.")
    p = Prize.new(3,1)
    @@monstruos << Monster.new("Yskhtihyssg-Goth", 12, bc, p)
    
    #Familia feliz
    bc = DeathBadConsequence.new("La familia te atrapa. Estás muerto.")
    p = Prize.new(4,1)
    @@monstruos << Monster.new("Familia feliz", 1, bc, p)
    
    #Roboggoth
    bc = SpecificBadConsequence.new("La quinta directiva " + 
    "primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.", 2,
    [TreasureKind::BOTHHANDS], Array.new)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Roboggoth", 8, bc, p)
    
    #El espia
    bc = SpecificBadConsequence.new("Te asusta en la noche. " +
    "Pierdes un casco visible.", 0,[TreasureKind::HELMET], Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("El espia", 5, bc, p)
    
    #El lenguas
    bc = NumericBadConsequence.new("Menudo susto te llevas."+
    " Pierdes 2 niveles y 5 tesoros visibles.",2,5,0)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("El lenguas", 20, bc, p)
    
    #Bicefalo
    bc = SpecificBadConsequence.new("Te faltan manos para tanta"+ 
    "cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3,
    [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],
    Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Bicefalo", 20, bc, p)
    
    ################## SECTARIOS #############################
    
    #El mal indecible impronunciable
    
    bc =SpecificBadConsequence.new("Pierdes 1 mano visible", 0, [TreasureKind::ONEHAND], Array.new)
    p = Prize.new(3, 1)
    @@monstruos << Monster.new("El mal indecible impronunciable",10,bc,p,-2)
    
    # Testigos oculares
    bc = NumericBadConsequence.new("Pierdes tus tesoros visibles. Jajaja", 0, @@max, 0)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Testigos oculares",6,bc,p,2)
    
    # El gran cthulhu
    
    bc = DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres.")
    p = Prize.new(2,5)
    @@monstruos << Monster.new("El gran cthulhu",20,bc,p,4)
    
    # Serpiente politico
    
    bc = NumericBadConsequence.new("Tu gobierno de recorta 2 niveles", 2, 0, 0)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Serpiente politico", 8, bc, p, 4)
    
    # Felpuggoth
    
    bc = SpecificBadConsequence.new(
      "Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, 
      [TreasureKind::HELMET, TreasureKind::ARMOR], 
      [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS])
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Felpuggoth",2, bc, p, 5)
    
    # Shoggoth
    bc = NumericBadConsequence.new("Pierdes 2 niveles", 2, 
      0, 0)
    p = Prize.new(4,2)
    @@monstruos << Monster.new("Shoggoth", 16, bc, p, -4)
    # Lolitagooth
    bc = NumericBadConsequence.new(
      "Pintalabios negro. Pierdes dos niveles", 2, 0, 0)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Lolitagooth",2,bc,p,3)
  end
  
  def self.monstruos
    @@monstruos
  end
  
  def self.newTreasures
    @@treasures = Array.new
    
    @@treasures << Treasure.new("¡Si,mi amo!",4, TreasureKind::HELMET)
    @@treasures << Treasure.new("Botas de investigacion",3, TreasureKind::SHOES)
    @@treasures << Treasure.new("Capucha de Cthulhu",3, TreasureKind::HELMET)
    @@treasures << Treasure.new("A prueba de babas",2, TreasureKind::ARMOR)
    @@treasures << Treasure.new("Botas de lluvia acida",1, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Casco minero",2, TreasureKind::HELMET)
    @@treasures << Treasure.new("Ametralladora Thompson",4, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Camiseta de la UGR",1, TreasureKind::ARMOR)
    @@treasures << Treasure.new("Clavo de rail ferroviario",3, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Cuchillo de sushi arcano",2, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Fez alopodo",3, TreasureKind::HELMET)
    @@treasures << Treasure.new("Hacha prehistorica",2, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("El aparato del Pr. Tesla",4, TreasureKind::ARMOR)
    @@treasures << Treasure.new("Gaita",4, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Insecticida",2, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Escopeta de tres cañones",4, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Garabato mistico",2, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("La rebeca metalica",3, TreasureKind::ARMOR)
    @@treasures << Treasure.new("Lanzallamas",4, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Necro-comicon",1, TreasureKind::ONEHAND)   
    @@treasures << Treasure.new("Necronomicon",5, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Linterna a dos manos",3, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Necro-gnomico",2, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Necrotelecom",2, TreasureKind::HELMET)
    @@treasures << Treasure.new("Mazo de los antiguos",3, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Necro-playboycon",3, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Porra preternatural",2, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Shogulador",1, TreasureKind::BOTHHANDS)
    @@treasures << Treasure.new("Varita de atizamiento",3, TreasureKind::ONEHAND)
    @@treasures << Treasure.new("Tentaculo de pega",2, TreasureKind::HELMET)
    @@treasures << Treasure.new("Zapato deja-amigos",1, TreasureKind::SHOES)
    
    
  end
  
  def self.newCultists
    @@cultists = Array.new
    @@cultists << Cultist.new("Agaricus",1)
    @@cultists << Cultist.new("Boletus",2)
    @@cultists << Cultist.new("Daldinia",1)
    @@cultists << Cultist.new("Bolbitius",2)
    @@cultists << Cultist.new("Calvatia",1)
    @@cultists << Cultist.new("Dermoloma",1)
  end
  
  def self.treasures
    @@treasures
  end
  
  def self.cultists
    @@cultists
  end
  
end 
  
end
