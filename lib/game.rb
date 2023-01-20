require 'json'
require_relative "../lib/building"
require_relative "../lib/player"

class Game

  def initialize
  end

  def initialize_buildings(board_file_path)
    file = File.read(board_file_path)
    @board_array = JSON.parse(file)
    @total_building_number = @board_array.length
    @buildings = @board_array.map { |b| Building.new(b)}
  end

  def initialize_players(players_array_path)
    @players = players_array_path.map { |p| Player.new(p) }
  end

  def initialize_dice(roll_file_path)
    file = File.read(roll_file_path)
    roll_array = JSON.parse(file)
  end

  def move(dice, player)
    # change the position
    current_position = player.position
    new_position = (current_position + dice) % @total_building_number
    # You get $1 when you pass GO (this excludes your starting move)
    if current_position + dice >= @total_building_number
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
    current_position = player.position
    current_building = @buildings[current_position]
    # If you land on a property, you must buy it
    if current_building.owner == "nobody"
      player.money -= current_building.price
      current_building.owner = player
      player.buildings.push(current_building)
      # If the same owner owns all property of the same colour, the rent is doubled
      if player.buildings.length > 1
        colour = current_building.colour
        same_color_buildings = @buildings.find_all {|b| b.colour == colour}
        if same_color_buildings.all? { |e| player.buildings.include?(e)}
          same_color_buildings.each{ |b| b.price *= 2}
        end
      end
    elsif current_building.owner != player
      # If you land on an owned property, you must pay rent to the owner
      player.money -= current_building.price
      current_building.owner.money += current_building.price
    end
  end

  def display
    puts "\n~  Woven Monopoly  ~"
    puts "🌳🌳 🌳 🏡🏡🏡🏡🏡 🌳 🌳🌳"
    puts "~  Let's have a look at the map  ~\n"
    @buildings.each { |b| puts b.show_building}
    puts "\n"
    @players.each_with_index do |e, i|
      puts "Player #{i + 1}: #{e.name} | money: $#{e.money}"
    end
    puts "\n💛💛 Game on 💛💛\n"
  end

  def status
    puts"\n"
    @players.each_with_index do |e, i|
      b = @buildings[e.position]
      puts "Player #{i + 1}: #{e.name} | money: $#{e.money} | #{b.show_building}"
    end
  end

end
