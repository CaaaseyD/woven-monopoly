require 'json'
require_relative "../lib/building"
require_relative "../lib/player"

class Game
  attr_accessor :buildings, :players, :roll

  def initialize(board_path, player_array, roll_path)
    board_file = File.read(board_path)
    board = JSON.parse(board_file)
    @buildings = board.map { |b| Building.new(b) }
    @players = player_array.map { |p| Player.new(p) }
    roll_file = File.read(roll_path)
    @roll = JSON.parse(roll_file)
  end

  def move(dice, player)
    # change the position
    current_position = player.position
    new_position = (current_position + dice) % @buildings.length
    # You get $1 when you pass GO (this excludes your starting move)
    if current_position + dice >= @buildings.length
      player.add_money
    end
    # update the new position
    player.update_position(new_position)
  end

  def pay_rent(player)
    if player.position != 0
      current_building = @buildings[player.position]
      # If you land on a property, you must buy it
      if current_building.owner == "nobody"
        player.money -= current_building.price
        current_building.owner = player
        player.buildings.push(current_building)
        # If the same owner owns all property of the same colour, the rent is doubled
        if player.buildings.length > 1
          same_colour_b = @buildings.find_all {|b| b.colour == current_building.colour}
          if same_colour_b.all? { |b| player.buildings.include?(b)}
            same_colour_b.each{ |b| b.price *= 2}
          end
        end
      elsif current_building.owner != player
        # If you land on an owned property, you must pay rent to the owner
        player.money -= current_building.price
        current_building.owner.money += current_building.price
      end
    end
  end

  # Once someone is bankrupt (key condition to stop the game)
  def check_is_alive?(player, players)
    if player.money < 0
      player.is_alive = false
      puts "\nPlayer #{player.name} hit a brankrupt!😢"
      who_is_winner?(players)
      puts "💛💛 Game over!💛💛\n\n"
      return false
    end
  end

  # whoever has the most money remaining is the winner
  def who_is_winner?(players)
    max_money = players.max_by{ |p| p.money }.money
    winners = players.select { |p| p.money == max_money }.map { |p| p.name }
    if winners.length == 1
    puts "The winner is: #{winners[0]}"
    else
      puts "The winner are:"
      winners.each { |w| puts w }
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

  def status(dice, player)
    puts "\n It's Player 😏 #{player.name}'s turn, roll the dice:"
    puts "> dice number: #{dice}"
    puts "> play's position: #{@buildings[player.position].show_building}"
    puts "> play's money: $#{player.money} \n"
    puts"\n"
    @players.each_with_index do |e, i|
      b = @buildings[e.position]
      puts "Player #{i + 1}: #{e.name} | money: $#{e.money} | #{b.show_building}"
    end
  end

end
