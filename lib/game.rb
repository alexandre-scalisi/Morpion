class Game 
  attr_reader :player1, :player2
  @@game_count = 0
  def initialize()
    @@game_count+=1
    @first_game = true
    creer_joueurs
  end

  def bienvenue
  puts "Bienvenu dans ce jeu du morpion, les règles sont simples,
  vous devez être deux joueurs et faire des lignes avec vos formes 
  pour gagner la partie.
  Les lignes peuvent etres horizontales, verticales et diagonales."
  end

  def creer_joueurs
    puts "Quels sont les noms de vos joueurs?"
    print "joueur1: "
    nom1 = gets.chomp
    print "joueur2: "
    nom2 = gets.chomp
    f1,f2 = choisir_formes
    @player1 = Player.new(nom1,f1)
    @player2 = Player.new(nom2,f2)
    puts "Vos joueurs ont été créés"
    puts "#{player1.name} : #{player1.shape}"
    puts "#{player2.name} : #{player2.shape}"
    puts "-"*30
  end

  def choisir_formes
    puts "Veuillez choisir la forme qu'utilisera votre joueur"
    forme1 =""
    while forme1.upcase != "O" && forme1.upcase != "X"
    print "joueur1: "
    forme1 = gets.chomp
    if forme1.upcase != "O" && forme1.upcase != "X"
      puts "selectionne une forme"
    end
    end
    forme2 = forme1.upcase == "O" ? "X" : "O"

    return forme1,forme2

  end

  def recommencer

   #Changer de forme
  end
end