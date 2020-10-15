class Game 
  attr_reader :player1, :player2, :game_count
  
  def initialize()
    @game_count=0
    bienvenue
    creer_joueurs
    continue = "O"
    while continue == "O"
    @game_count+=1
    puts "Partie n°#{@game_count}"
    puts
    choisir_formes
    
    @board = Board.new
    @show = Show.new(@board)
    @show.show_board
    sleep(2)
    tour_par_tour
    @show.show_board
    fin_partie
    continue = recommencer?
    if continue == "O" then reinitialiser end
    end

    puts "Adieu "
  end

  def bienvenue
  puts "Bienvenu dans ce jeu du morpion, les règles sont simples,\n" +
  "vous devez être deux joueurs et faire des lignes avec vos formes pour gagner la partie.\n" +
  "Les lignes peuvent etres horizontales, verticales et diagonales."
  puts
  end

  def creer_joueurs
    puts "Quels sont les noms de vos joueurs?"
    print "joueur1: "
    nom1 = gets.chomp
    print "joueur2: "
    nom2 = gets.chomp
    @player1 = Player.new(nom1)
    @player2 = Player.new(nom2)
    puts "Vos joueurs ont été créés"
    puts
    
  end

  def choisir_formes
    
    puts "Un des deux joueurs choisi sa forme et l'autre aura automatiquement l'autre"
    forme1 =""
    sample = [@player1,@player2]
    random_player = sample.delete_at(rand(0..1))
    puts "#{random_player.name} choisit sa forme :"
    while forme1.upcase != "O" && forme1.upcase != "X"
    print "> "
    forme1 = gets.chomp
    if forme1.upcase != "O" && forme1.upcase != "X"
      puts "selectionne une forme"
    end
    end

    random_player.shape = forme1.upcase == "O" ? "O" : "X"
    sample[0].shape = random_player.shape == "O" ? "X" : "O"

    puts "#{player1.name} : #{player1.shape}"
    puts "#{player2.name} : #{player2.shape}"
    puts "-"*45

  end

  def tour_par_tour
    puts "-"*45
    puts
    puts "Commençons!"
    player1_choosing = [true,false].sample
    9.times do |i|
      puts
      choosing_player = player1_choosing ? @player1 : @player2
      puts "C'est au joueur #{choosing_player.name} de jouer ( #{choosing_player.shape} )."
      @show.show_board
      choix().make_shape(choosing_player.shape)
      puts 
      @winner = @board.winner?
      if @winner != " "
        break
      end
      
      player1_choosing = !player1_choosing

    end
  end

  def choix
    puts
    choice = ""
    until choice.is_a?(Case) && choice.is_used?() == false
      puts "Choisissez une case"
      print "> "
      choice = @board.recuperer_case_nom(gets.chomp.upcase)     
    end
    return choice
  end
  def fin_partie
    puts "-"*45
    puts
    puts "La partie est terminée"
    if @winner == " "
      puts "personne ne gagne"
    else 
      @player1.shape == @winner ? (puts "#{player1.name} a gagné !") : (puts "#{player2.name} a gagné !")
    end
    
  end
  def recommencer?
    restart = " "
    until restart == "O" ||restart == "N"
      puts "Voulez vous relancer O/N?"
      print "> "
      restart = gets.chomp.upcase
    end
    return restart
  end

  def reinitialiser
    player1.reinitialiser_forme
    player2.reinitialiser_forme
    puts
    puts "*"*45
    puts
    system("clear")
  end
end