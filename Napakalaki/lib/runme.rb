# encoding: UTF-8
# Autora: Minim

#EXAMEN 

require_relative 'examen.rb'

module NapakalakiGame

class Runme
  def self.main
    examen = Examen.new
    examen.run
  end
end

if $0 == __FILE__
  Runme.main()
end

end

#EXAMEN