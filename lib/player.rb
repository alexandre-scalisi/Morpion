class Player

  attr_reader :shape, :name
  def initialize(name,shape)
    @name = name
    @points = 0
    @shape = shape

  end
end