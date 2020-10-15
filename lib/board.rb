class Board
  attr_reader :cases

  def initialize
    @cases = []
    3.times do |i|
      line = []
      3.times do |j|
        line << Case.new()
      end
      @cases << line
    end
  end

  def winner? 
    winner = " "
    winner = check_horizontal
    winner = check_vertical
    winner = check_diagonal
    
  end

  private
  def check_horizontal
    3.times do |i|
        if cases[i][0].shape == " "
          next
        end
        if (cases[i][0].shape == cases[i][1].shape) && (cases[i][1].shape == cases[i][2].shape) 
          puts "les #{cases[i][0].shape} gagnent ligne n°#{i+1}."
          return cases[i][0].shape
        end
    end
    return " "
  end

  def check_vertical
    
    3.times do |i|
      if cases[0][i].shape == " "
        next
      end
      
      if (cases[0][i].shape == cases[1][i].shape) && (cases[1][i].shape == cases[2][i].shape) 
        puts "les #{cases[i][0].shape} gagnent ligne n°#{i+1}."
        return cases[i][0].shape
      end
  end
  return " "
  end


  def check_diagonal
    
    diagonal = false
      if cases[1][1].shape == " "
        return " "
      end
      
      
      if (cases[0][0].shape == cases[1][1].shape) && (cases[1][1].shape == cases[2][2].shape) 
        puts "les #{cases[1][1].shape} gagnent diagonale A1-C3."
        diagonal = true
      end

      if (cases[0][2].shape == cases[1][1].shape) && (cases[1][1].shape == cases[2][0].shape) 
        if diagonal 
          puts "et aussi diagonale A3-C1."
        else
          puts "les #{cases[1][1].shape} gagnent diagonale A3-C1."
        end
        diagonal = true
      end
  
  return diagonal ? cases[1][1].shape : " "
  end


end