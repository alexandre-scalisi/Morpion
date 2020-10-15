# frozen_string_literal: true

class Case
  attr_reader :shape, :name

  def initialize(name)
    @shape = ' '
    @is_used = false
    @name = name
  end

  def make_shape(shape)
    @is_used = true
    @shape = shape
  end

  def is_used?
    if @is_used
      puts 'Cette case est déja utilisée'
      puts
      true
    else
      false
    end
  end
end
