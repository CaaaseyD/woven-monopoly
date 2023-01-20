### Game rules
require 'json'


class Game
  attr_accessor :game_status

  def initialize
    @game_status = true
  end

  def initialize_buildings(board_file_path)
    file = File.read(board_file_path)
    @board_array = JSON.parse(file)
    @total_building_number = @board_array.length
  end

  def move(step, player)
    # change the position
    current_position = player.position
    new_position = (current_position + step) % @total_building_number
    # You get $1 when you pass GO (this excludes your starting move)
    if current_position + step >= @total_building_number
      player.add_money
    end
    # update the new position
    player.update_position(new_position)
  end
  # Once someone is bankrupt, whoever has the most money remaining is the winner
  def check_is_alive?(player)
    if player.money < 0
      player.is_alive = false
    end
  end

  def pay_rent(player)
    # * If you land on a property, you must buy it
# * If you land on an owned property, you must pay rent to the owner
# * If the same owner owns all property of the same colour, the rent is doubled

  end

  def display
    puts "\n~  Woven Monopoly  ~"
    puts "🌳🌳 🌳 🏡🏡🏡🏡🏡 🌳 🌳🌳"
    puts "~  Let's have a look at the map  ~\n"
    @buildings.each { |b| puts b.show_building}
    puts "\n"
    puts "\n💛💛 Game on 💛💛\n"
  end

end
