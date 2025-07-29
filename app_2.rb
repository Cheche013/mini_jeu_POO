require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS PAS POO' !|"
puts "|           Que le meilleur gagne !         |"
puts "---------------------------------------------"

puts "Quel est ton prénom, ô combattante sortie des abîmes ?"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)

player1 = Player.new("Lilian")
player2 = Player.new("Florian")
enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

puts "\nVoici ton état :"
user.show_state
puts

#--ACTIONS--#

puts "Quelle action veux-tu effectuer ?"
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts "attaquer un joueur en vue :"

#--Stats ennemies--#

enemies.each_with_index do |enemy, index|
  if enemy.life_points > 0
    puts "#{index} - #{enemy.show_state}"
  end
end

print "> "
choice = gets.chomp
puts

if choice == "a"
  user.search_weapon
elsif choice == "s"
  user.search_health_pack
elsif choice =="0" && player1.life_points > 0
  user.attacks(player1)
elsif choice == "1" && player2.life_points > 0
  user.attacks(player2)
else
  puts "Commande invalide ou joueur déjà mort.."
  end

  puts "\n>>> Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end


puts "\n---------------------------"
puts "Appuie sur [Entrée] pour passer au tour suivant"
gets.chomp
end


puts "\nGAME OVER"

if user.life_points > 0
  puts "J'AI GAGNÉ !!!"

else
  puts" Ah...Bon, j'ai perdu ^^!"
end

