require 'bundler'
Bundler.require

require_relative 'lib/board'                   
require_relative 'lib/player'
require_relative 'lib/case'                   
require_relative 'lib/game'
require_relative 'show.rb'

game1 = Game.new()
binding.pry