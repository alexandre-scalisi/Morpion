class Player

  attr_reader :name
  attr_accessor :shape
  def initialize(name)
    @name = name
    @points = 0

  end

  def shape=(forme)
    if @shape.nil?
   @shape = forme
    else
    puts "Forme déja choisie"
    end
  end

  def reinitialiser_forme
    @shape = nil
  end

end