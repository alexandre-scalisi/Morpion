# frozen_string_literal: true

class Game
  attr_reader :player1, :player2, :game_count

  # C'est ici qu'on appelle toutes les méthodes
  def initialize
    @game_count = 0 # le nombre de parties jouées
    bienvenue
    creer_joueurs
    continue = 'O'
    while continue == 'O' # On relance le programme si l'utilisateur repond "O" à la fin
      @game_count += 1
      puts "Partie n°#{@game_count}"
      puts
      choisir_formes

      @board = Board.new
      @show = Show.new(@board)
      @show.show_board
      sleep(3)
      tour_par_tour # on attend 3 secondes
      sleep(3)
      @show.show_board
      fin_partie
      continue = recommencer?
      reinitialiser if continue == 'O'
    end

    puts "\nAdieu "
  end

  def bienvenue
    puts "Bienvenu dans ce jeu du morpion, les règles sont simples,\n" \
         "vous devez être deux joueurs et faire des lignes avec vos formes pour gagner la partie.\n" \
         'Les lignes peuvent etres horizontales, verticales et diagonales.'
    puts
  end

  def creer_joueurs
    puts 'Quels sont les noms de vos joueurs?'
    print "\njoueur1: "
    nom1 = gets.chomp
    print 'joueur2: '
    nom2 = gets.chomp
    @player1 = Player.new(nom1)
    @player2 = Player.new(nom2)
    puts "\nVos joueurs ont été créés"
    puts
    sleep(1)
    system('clear') # On clear le terminal
  end

  def choisir_formes
    puts "Un des deux joueurs choisi sa forme et l'autre aura automatiquement l'autre forme"
    forme1 = ''
    sample = [@player1, @player2]
    random_player = sample.delete_at(rand(0..1))            # un joueur est pris au hasard pour choisir sa forme
    puts "#{random_player.name} choisit sa forme :"         # et on met automatiquement l'autre forme à l'autre joueur
    while !forme1.casecmp('O').zero? && !forme1.casecmp('X').zero?
      print '> '
      forme1 = gets.chomp
      if !forme1.casecmp('O').zero? && !forme1.casecmp('X').zero? # meme si l'utilisateur met le "o" en petit ca fera un "O" majuscule
        puts 'selectionne une forme'
      end
    end

    random_player.shape = forme1.casecmp('O').zero? ? 'O' : 'X'
    sample[0].shape = random_player.shape == 'O' ? 'X' : 'O' # on assigne les formes aux joueurs

    puts "#{player1.name} : #{player1.shape}"
    puts "#{player2.name} : #{player2.shape}"
    puts '-' * 45
  end

  def tour_par_tour
    puts '-' * 45
    puts
    puts 'Commençons!'
    player1_choosing = [true, false].sample # on selectionne le joueur qui va commencer à jouer au hasard

    9.times do |_i| # on loop pendant 9 tours maximum ( si un joueur gagne avant on quitte)
      puts
      choosing_player = player1_choosing ? @player1 : @player2
      puts "C'est au joueur #{choosing_player.name} de jouer ( #{choosing_player.shape} )."
      @show.show_board
      choice = choix # on récupère la position voulue par le joueur

      choice.make_shape(choosing_player.shape) # on utilise la forme du joueur dans la position qu'il veut
      puts
      @winner = @board.winner?
      break if @winner != ' ' # s'il y a un gagnant on quitte la boucle
      player1_choosing = !player1_choosing # on inverse la variable booleene pour changer le joueur qui joue
    end
  end

  def choix
    puts
    choice = ''
    until choice.is_a?(Case) && choice.is_used? == false
      puts 'Choisissez une case'
      print '> '
      choice = @board.recuperer_case_nom(gets.chomp.upcase)    # on récupère l'input de l'utilisateur puis on vérifie s'il y a bien une
    end                                                        # case qui porte ce nom.
    choice
  end

  def fin_partie
    puts '-' * 45
    puts
    puts 'La partie est terminée'
    if @winner == ' '
      puts 'Personne ne gagne'
    elsif @player1.shape == @winner
      @player1.win # augmente le score du joueur de 1 et affiche qu'il a gagné
    else
      @player2.win
    end
    puts
    puts "#{@player1.name} : #{@player1.points} pts"
    puts "#{@player2.name} : #{@player2.points} pts"
  end

  def recommencer?
    restart = ' '
    puts
    until restart == 'O' || restart == 'N'
      puts 'Voulez vous relancer O/N?'
      print '> '
      restart = gets.chomp.upcase
    end
    restart
  end

  def reinitialiser
    player1.reinitialiser_forme
    player2.reinitialiser_forme
    puts
    puts '*' * 45
    puts
    system('clear')
  end
end
