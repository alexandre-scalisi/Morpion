# frozen_string_literal: true

class Player
  attr_reader :name, :points, :shape
  def initialize(name)
    @name = name
    @points = 0
  end

  def shape=(forme)
    if @shape.nil?
      @shape = forme
    else
      puts 'Forme déja choisie'
    end
  end

  def reinitialiser_forme
    @shape = nil
  end

  def win
    puts "#{@name} a gagné la partie"
    @points += 1
  end
end
