class Board
	def initialize #On initialise le plateau
		@case1=BoardCase.new
		@case2=BoardCase.new
		@case3=BoardCase.new
		@case4=BoardCase.new
		@case5=BoardCase.new
		@case6=BoardCase.new
		@case7=BoardCase.new
		@case8=BoardCase.new
		@case9=BoardCase.new
	end

	def change_value(indice, symbole) #Cette fonction est appelée quand un joueur sélectionne une case, elle sert à modifier cette case
		if indice == "1"
			if @case1.value == " "
				@case1.value = symbole
			else
				return 0
			end
		
		elsif indice == "2"
			if @case2.value == " "
				@case2.value = symbole
			else
				return 0
			end
		
		elsif indice == "3"
			if @case3.value == " "
				@case3.value = symbole
			else
				return 0
			end
		
		elsif indice == "4"
			if @case4.value == " "
				@case4.value = symbole
			else
				return 0
			end
		
		elsif indice == "5"
			if @case5.value == " "
				@case5.value = symbole
			else
				return 0
			end
		
		elsif indice == "6"
			if @case6.value == " "
				@case6.value = symbole
			else
				return 0
			end
		
		elsif indice == "7"
			if @case7.value == " "
				@case7.value = symbole
			else
				return 0
			end
		
		elsif indice == "8"
			if @case8.value == " "
				@case8.value = symbole
			else
				return 0
			end
		
		elsif indice == "9"
			if @case9.value == " "
				@case9.value = symbole
			else
				return 0
			end
		end
		return 1
	end #si cette fonction rend 0, le plateau n'a pas été modifié (cela signifie que la case demandée n'est pas vide)

	def test
		#Cette fonction sert à déterminer si un joueur a gagné
		#On check d'abord sur les colonnes
		if @case1.value == @case4.value && @case4.value == @case7.value
			if @case1.value == "X"
				return 1
			elsif @case1.value == "O"
				return 2
			end
		elsif @case2.value == @case5.value && @case5.value == @case8.value
			if @case2.value == "X"
				return 1
			elsif @case2.value == "O"
				return 2
			end
		elsif @case3.value == @case6.value && @case6.value == @case9.value
			if @case3.value == "X"
				return 1
			elsif @case3.value == "O"
				return 2
			end
		end

		#On check ensuite sur les lignes
		
		if @case1.value == @case2.value && @case2.value == @case3.value
			if @case1.value == "X"
				return 1
			elsif @case1.value == "O"
				return 2
			end
		elsif @case4.value == @case5.value && @case5.value == @case6.value
			if @case4.value == "X"
				return 1
			elsif @case4.value == "O"
				return 2
			end
		elsif @case7.value == @case8.value && @case8.value == @case9.value
			if @case7.value == "X"
				return 1
			elsif @case7.value == "O"
				return 2
			end
		end

		#On check ensuite sur les diagonales

		if @case1.value == @case5.value && @case5.value == @case9.value
			if @case1.value == "X"
				return 1
			elsif @case1.value == "O"
				return 2
			end
		elsif @case7.value == @case5.value && @case5.value == @case3.value
			if @case7.value == "X"
				return 1
			elsif @case7.value == "O"
				return 2
			end
		end
	end

	def display #Cette fonction, appelée à chaque tour de jeu, affiche le plateau
		puts" "
		puts @case7.value + " | " + @case8.value + " | " + @case9.value
		puts "----------"
		puts @case4.value + " | " + @case5.value + " | " + @case6.value
		puts "----------"
		puts @case1.value + " | " + @case2.value + " | " + @case3.value
		puts ""
	end 


end





class BoardCase
	attr_accessor :value
	def initialize(value=" ") #On initialise juste des cases vides, utilisées dans la classe Board vue plus haut
		@value=value
	end

end





class Player
	attr_accessor :name, :victory

	def initialize(name,victory = false) # On initialise des joueurs avec leur noms, et leur état (ils n'ont pas encore gagné)
		@name = name
		@victory = victory
	end


end



class Game # C'est ici que va se dérouler le jeu
	def initialize(name1,name2) # On crée les 2 joueurs et le plateau
		@player1 = Player.new(name1)
		@player2 = Player.new(name2)
		@board = Board.new
	end

	def play
		#On explique les consignes d'abord
		puts ""
		puts "Bienvenue dans ce super Tic Tac Toe\nLes cases sont numérotées de 1 à 9, la case numéro 1 étant celle en bas à gauche, et la case numéro 9 en haut à droite, comme sur votre 
clavier ! Si vous ne comprenez pas je vais quand même vous faire un dessin."
		puts " \n
		7 | 8 | 9 \n
		----------\n
		4 | 5 | 6 \n
		----------\n
		1 | 2 | 3 \n
		 "
		puts "Le but est bien sûr de réussir à aligner 3 symboles sur le plateau. Commençons !"

		tour = 1 #C'est le compteur de tours, on l'initialise à 1 pour commencer au tour 1, ce qui est plus naturel

		#Voici la boucle dans laquelle va se dérouler toute la partie. Un tour de boucle vaut un tour de jeu. 
		while @player1.victory == false && @player2.victory == false && tour <= 9
			if tour % 2 == 1 #Si le numéro du tour est pair, c'est au joueur 1 de jouer
				puts ""
				puts @player1.name + ", c'est à ton tour de jouer. Donne une case en entrant un nombre compris entre 1 et 9."
				reponse=gets.chomp
				if ["1","2","3","4","5","6","7","8","9"].include? reponse
					retour = @board.change_value(reponse,"X")
					if retour==0
						puts ""
						puts "Cette case n'est pas vide, veuillez en choisir une autre" #On a vu plus haut pourquoi.
						tour -= 1 #A chaque fois qu'il y a une erreur, le tour n'est pas validé puisque le plateau n'a pas été modifié
								#On revient donc un tour en arrière pour que le joueur qui a entré une commande non valide puisse rejouer
								#Ce commentaire est valable pour chaque "tour -= 1"
					end
				else #Si ce n'est pas un chiffre entre 1 et 9 qui est entré dans la console, on entre dans cette boucle.
					puts ""
					puts "NOOOOON ! On avait dit entre 1 et 9 ! Réessaie."
					tour -=1
				end
			else #Si le numéro du tour est impair, c'est au joueur 2 de jouer. Cette boucle n'est pas commentée car c'est les mêmes
				#commentaires que pour la boucle du joueur 1.
				puts ""
				puts @player2.name + ", c'est à ton tour de jouer. Donne une case en entrant un nombre compris entre 1 et 9."
				reponse=gets.chomp
				if ["1","2","3","4","5","6","7","8","9"].include? reponse
					retour = @board.change_value(reponse,"O")
					if retour==0
						puts ""
						puts "Cette case n'est pas vide, veuillez en choisir une autre"
						tour -=1
					end
				else
					puts ""
					puts "NOOOOON ! On avait dit entre 1 et 9 ! Réessaie."
					tour -=1
				end
			end
			
			test_win = @board.test #On vérifie à chaque fin de tour si un joueur a gagné, si c'est le cas cela nous fera sortir de la
									#boucle while
			if test_win == 1
				@player1.victory = true
			elsif test_win == 2
				@player2.victory = true
			end

			tour +=1 #On passe au tour suivant et on affiche le plateau.
			@board.display
		end

		if @player1.victory == true #C'est le bilan de la fin de la partie
			puts @player1.name + " a été meilleur, il remporte cette partie."
		elsif @player2.victory == true 
			puts @player2.name + " a été meilleur, il remporte cette partie."
		else
			puts "C'est un match nul."
		end 

	end

end

def jouer #C'est la fonction qui va être appelée pour jouer, et qui permet aux joueurs de se présenter
	puts "Choisissez le pseudo du joueur 1"
	name1 = gets.chomp
	puts "Choisissez le pseudo du joueur 2"
	name2 = gets.chomp

	partie = Game.new(name1,name2)
	partie.play
end

jouer() #On lance la partie

