require_relative "../lib/game"

roll_file_path = '../spec/rolls_1.json' # you can change to '../spec/helper/rolls_2.json'
board_file_path = '../spec/board.json'
players_array_path = ["Peter", "Billy", "Charlotte", "Sweedal"] # you can add/remove players here'

# Initiate a new game
newGame = Game.new
# Initiate buildings
buildings = newGame.initialize_buildings(board_file_path)
# Initiate players
players = newGame.initialize_players(players_array_path)
# Initiate dice
dice_array = newGame.initialize_dice(roll_file_path)
# Display the infos of the game
newGame.display
# Game iterate the dice array
for i in 0...dice_array.length do
  #Players take turns to roll the dice
  current_player = players[i % players.length]
  newGame.move(dice_array[i], current_player)
  if current_player.position != 0
    newGame.pay_rent(current_player)
  end
  current_building = buildings[current_player.position]
  #Output the result of this turn
  puts "\n It's Player 😏 #{current_player.name}'s turn, roll the dice:"
  puts "> dice number: #{dice_array[i]}"
  puts "> play's position: #{current_building.show_building}"
  puts "> play's money: $#{current_player.money} \n"
  newGame.status
  sleep(0.5)

  if newGame.check_is_alive?(current_player) == false
    puts "\nPlayer #{current_player.name} hit a brankrupt!"
    puts "💛💛 Game over!💛💛"
    max_money = players.max_by{ |p| p.money }.money
    winners = players.select { |p| p.money == max_money }.map { |p| p.name }
    if winners.length == 1
    puts "The winner is: #{winners[0]}"
    else
      winners.each { |w| puts w }
    end
    puts "🚀🚀 END 🚀🚀"
    break
  end
end
