class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

def gets_damage(damage_received)
  @life_points -= damage_received

  if @life_points <= 0
    @life_points = 0
    puts "Le légendaire #{@name} a été tragiquement tué ... Que son âme repose en paix !"
   end
  end

  def attacks(player)
     puts "#{@name} attaque #{player.name}"
     damage = compute_damage
     player.gets_damage(damage)
     puts "Il lui dégomme la tronche #{damage} points de dommages"
  end
  
  def compute_damage
    return rand(1..7)
  end

end

class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

   def compute_damage
    return rand(1..7) * @weapon_level
  end

   #Recherche d'une arme meilleure---------------------------------

  def search_weapon
    new_weapon_level = rand(1..7)
    puts "J'ai trouvé une arme de niveau #{new_weapon_level}"

    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
    puts "AAAAAh....AH ! Elle est meilleure que mon arme actuelle : Je la prends, sorry les gars ;)"

    else
      puts "Pffff .. Bof. Elle n'est pas mieux que mon arme actuelle"
    end
  end
  
  #Potion-------------------------------------------------------

  def search_health_pack
    dice = rand(1..7)

    if dice == 1
      puts " Dommage..Je n'est rien trouvé.."
    
    elsif dice >= 2 && dice <= 5
      puts "Yess, un pack de +50 de pv !"
      @life_points += 50
      @life_points = 100 if @life_points > 100
    
    else # sup à 7
      puts "YESSSS, un pack +80 de pv ! (Vous êtes fichu)"
      @life_points += 80
      @life_points = 100 if @life_points > 100
    end
  end

end
