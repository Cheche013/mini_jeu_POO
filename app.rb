require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Lilian")
player2 = Player.new("Florian")

puts "Voici l'état ( pour le moment ) de chaque joueur armés jusqu'aux dents"
puts "----------------------------------------------------------------------"
player1.show_state
player2.show_state
puts "Qui ressortira vainqueur de ce duel à mort ?"

while player1.life_points > 0 && player2.life_points > 0
  puts "Prend garde à toi mécréant !!!!"
  puts " AAAaaaagh..."

  player1.attacks(player2)

  if player2.life_points <= 0
    break
  end

  puts
  player2.attacks(player1)

  puts
  puts "Voici l'état de chaque joueur après l'assaut"
  puts "............................................."
  player1.show_state
  player2.show_state
  puts
end


binding.pry
