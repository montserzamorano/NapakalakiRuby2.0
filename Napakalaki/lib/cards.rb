# encoding: UTF-8
# Autora: Minim
class Cards
  @@max = 10
  def self.newMonsters
    @@monstruos = Array.new
    #3 byakhees de bonanza
    bc = BadConsequence.new("Pierdes tu armadura visible y otra oculta", 0, 0,
      0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    p = Prize.new(2,1)
    @@monstruos << Monster.new("3 byakhees de bonanza", 8, bc, p)
    
    #Chibithulhu
    bc = BadConsequence.new("Embobados con el lindo primigenio te descartas" + 
        " de tu casco visible",0,0,0, [TreasureKind::HELMET], Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Chibithulhu", 2, bc, p)
    
    #El sopor de Dunwich
    bc = BadConsequence.new("El primordial bostezo contagioso. Pierdes el" +
        "calzado visible.", 0,0,0, [TreasureKind::SHOES], Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("El sopor de Dunwich", 2, bc, p)
    
    #Angeles de la noche ibicenca
    bc = BadConsequence.new("Te atrapan para llevarte de fiesta y te dejan " +
      "caer en mitad del vuelo. Descarte 1 mano visible y 1 mano oculta.",0,0,
    0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    p = Prize.new(4,1)
    @@monstruos << Monster.new("Angeles de la noche ibicenca", 14, bc, p)
    
    #El gorron en el umbral
    bc = BadConsequence.new("Pierdes todos tus tesoros visibles", 0, @@max, 
      Array.new, Array.new)
    p = Prize.new(3,1)
    @@monstruos << Monster.new("El gorron en el umbral", 10, bc, p)
    
    #HP Munchcraft
    bc = BadConsequence.new("Pierdes la armadura visible", 0,0,0, 
      [TreasureKind::ARMOR], Array.new)
    p = Prize.new(2,1)
    @@monstruos << Monster.new("HP Munchcraft", 6, bc, p)
    
    #Bichgooth
    bc = BadConsequence.new("Sientes bichos bajo la ropa. Descarta la" +
        " armadura visible.",0,0,0,[TreasureKind::ARMOR], Array.new)
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Bichgooth", 2, bc, p)
    
    #El rey de rosa
    bc = BadConsequence.new("Pierdes 5 ninveles y 3 tesoros visibles",
    5,3,0, Array.new, Array.new)
    p = Prize.new(4,2)
    @@monstruos << Monster.new("El rey de rosa", 13, bc, p)
   
    #La que redacta en las tinieblas
    p = Prize.new(1,1)
    @@monstruos << Monster.new("La que redacta en las tinieblas", 2, bc, p)
    
    #Los hondos
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Los hondos", 8, bc, p)
    
    #Semillas Cthulhu
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Semillas Cthulhu", 4, bc, p)
    
    #Dameargo
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Dameargo", 1, bc, p)
    
    #Pollipolipo volante
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Pollipolipo volante", 3, bc, p)
    
    #Yskhtihyssg-Goth
    p = Prize.new(3,1)
    @@monstruos << Monster.new("Yskhtihyssg-Goth", 12, bc, p)
    
    #Familia feliz
    p = Prize.new(4,1)
    @@monstruos << Monster.new("Familia feliz", 1, bc, p)
    
    #Roboggoth
    p = Prize.new(2,1)
    @@monstruos << Monster.new("Roboggoth", 8, bc, p)
    
    #El espia
    p = Prize.new(1,1)
    @@monstruos << Monster.new("El espia", 5, bc, p)
    
    #El lenguas
    p = Prize.new(1,1)
    @@monstruos << Monster.new("El lenguas", 20, bc, p)
    
    #Bicefalo
    p = Prize.new(1,1)
    @@monstruos << Monster.new("Bicefalo", 20, bc, p)
  end
end
