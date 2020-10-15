class Case
  attr_reader :is_used, :shape

  def initialize()
    @shape = " "
    @is_used = false
  end

  def make_shape(shape)
    if @is_used
      puts "Cette case est déjà utilisée veuillez en choisir une autre"
    else
      @is_used = true
      @shape=shape
    end
  end
end