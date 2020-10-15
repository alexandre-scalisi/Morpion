class Show

  attr_accessor :board
  def initialize(board)
    @board = board
  end

  def show_board
    
    puts
    3.times do |i|
      puts " -----------" + " "*10 + "  --------------"
      3.times do |j|
        print "| #{@board.cases[i][j].shape} " 
      end
      print "|" + " "*10
      3.times do |j|
        print  "| #{(i+65).chr}#{(j+49).chr} "
      end
      puts "|"
      
    en
    puts " -----------" + " "*10 + "  --------------"
    
  end
end