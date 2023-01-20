require_relative "../lib/game"

roll_path = '../spec/rolls_1.json' # you can change to '../spec/helper/rolls_2.json'
board_path = '../spec/board.json'
players_array = ["Peter", "Billy", "Charlotte", "Sweedal"] # you can add/remove players here'

# Initiate a new game
newGame = Game.new(board_path, players_array, roll_path)
players_arr = newGame.players
roll_arr = newGame.roll

# Display the info of the game
newGame.display

# the roll array is set, Game iterates the roll to begin
for i in 0...roll_arr.length do
  #Players take turns to roll the dice
  current_player = players_arr[i % players_arr.length]
  newGame.move(roll_arr[i], current_player)
  newGame.pay_rent(current_player)
  # Show the result of this turn
  newGame.status(roll_arr[i], current_player)
  sleep(0.5)
  # Check the player is alive or not
  if newGame.check_is_alive?(current_player, players_arr) == false
    break
  end
end
