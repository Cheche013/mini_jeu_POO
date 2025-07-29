class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @players_left = 10
    @enemies_in_sight = []
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && (@players_left > 0 || @enemies_in_sight.any?)
  end

  def show_players
    puts "\n#{@human_player.name} a #{@human_player.life_points} points de vie et une arme de niveau #{@human_player.weapon_level}"
    puts "Ennemis en vue : #{@enemies_in_sight.size}"
  end

  def new_players_in_sight
    if @players_left == 0
      puts " Tous les ennemis sont déjà en vue !"
      return
    end


    dice_roll = rand(1..6)
    if dice_roll == 1
      puts "Aucun nouvel ennemi n'arrive ce tour-ci...Pfiouuu"
    elsif dice_roll.between?(2, 4)
      create_enemy(1)
    else
      create_enemy(2)
    end
  end

  def create_enemy(number)
    number.times do 
      id = rand(1000...9999)
      new_enemy = Player.new("ennemi_#{id}")
      @enemies_in_sight << new_enemy
      @players_left -= 1
      puts " Un nouvel ennemi apparaît : #{new_enemy.name} !"
    end
  end

  def menu
    puts "\n Que veux-tu faire, valeureuse guerrière ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher un pack de soins"
    puts "\nAttaquer un joueur en vue :"

    @enemies_in_sight.each_with_index do |enemy, index|
      if enemy.life_points > 0
        puts "#{index} - #{enemy.name} (#{enemy.life_points} PV)"
      end
    end
  end
    
  def menu_choice(choice)
    if choice == "a"
      @human_player.search_weapon
    elsif choice == "s"
      @human_player.search_health_pack
    elsif choice.to_i.to_s == choice  # si le choix est un chiffre
      index = choice.to_i
      enemy = @enemies_in_sight[index]
      if enemy && enemy.life_points > 0
        @human_player.attacks(enemy)
        if enemy.life_points <= 0
          puts "#{enemy.name} est DEAD !"
          kill_player(enemy)
        else
          puts "Cet ennemi est déjà vaincu ou inexistant calm down cheche"
        end
      end
    else
      puts "Commande inconnue...oupsss"
    end
  end

  def kill_player(player)
    @enemies_in_sight.delete(player)
  end

  #Riposte ennemis

  def enemies_attack
    puts "\n Les ennemis Mages noires contre-attaquent !"
    @enemies_in_sight.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(@human_player)
      end
    end
  end

  def end_game
    puts "\n FINI !!!"
    if @human_player.life_points > 0
      puts " YOU WIN, tu as vaincu tous les Mages noires !!"
    else
      puts " Tu es morte... Bon on se revoit dans l'au-delà !"
    end
  end
end

