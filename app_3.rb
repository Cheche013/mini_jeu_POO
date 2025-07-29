require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|     Le but du jeu est d'être la dernière    |"
puts "|             survivante !                |"
puts "------------------------------------------------\n\n"

puts "Quel est ton prénom, grande héroïne ?"
print "> "
player_name = gets.chomp

my_game = Game.new(player_name)

while my_game.is_still_ongoing?
  puts "\n==========================="
  puts "       NOUVEAU TOUR        "
  puts "===========================\n"

  my_game.new_players_in_sight
  my_game.show_players
  my_game.menu

  print "> "
  choice = gets.chomp
  my_game.menu_choice(choice)

  my_game.enemies_attack
end

my_game.end_game
