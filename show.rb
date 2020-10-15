# frozen_string_literal: true

class Show
  def initialize(board)
    @board = board
  end

  def show_board
    puts 'Voici le board'
    puts
    3.times do |i|
      puts ' -----------' + ' ' * 10 + '  --------------'
      3.times do |j|
        print "| #{@board.cases[i][j].shape} "
      end
      print '|' + ' ' * 10
      3.times do |j|
        print "| #{@board.cases[i][j].name} "
      end
      puts '|'
    end
    puts ' -----------' + ' ' * 10 + '  --------------'
    puts
  end
end
