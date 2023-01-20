require_relative "../lib/game"
require_relative "../lib/player"
require_relative "../lib/dice"

roll_file_path = '../spec/rolls_1.json' # you can change to '../spec/helper/rolls_2.json'
board_file_path = '../spec/board.json'
players_array_path = ["Peter", "Billy", "Charlotte", "Sweedal"] # you can add/remove players here'

# Initiate a new game
newGame = Game.new
# Display the infos of the game
#show the board (buildings name color and price)
#show players info (name, position and money)
newGame.display

if newGame.game_status
    #begin the game
    #4 players take turns, show current_player position, rent paided to, money updated
  players.circle.each do |player|
  # update position(dice)
  # update money
    move(step, player)
    update_money(step, player)
  end
  #end of the game if Once someone is bankrupt, whoever has the most money remaining is the winner
  #maybe 1 or more winners
  if check_is_alive?(player)== false
    newGame.game_status == false
    puts "end of the game"
    break
  end
end

#end of the game and restart
