### Woven Monopoly
* Hi everyone!
* Welcome to this commandline monopoly game!

### How to run it
* Check you've installed Ruby
* Open your Terminal at the location of 'lib' file
* Run "ruby interface.rb"

![image](https://user-images.githubusercontent.com/111398626/214175544-6047aef2-c76d-495d-9fe8-e9562127b9f2.png)

For example, here is result of the rolls_1 game demo

![image](https://user-images.githubusercontent.com/111398626/214175578-904ba9fa-f96f-4fde-901f-6379881660bb.png)

* There are 2 pre-set demo of the the dice rolls, the game is deterministic.
* You may change roll_path = '../spec/rolls_1.json' to '../spec/helper/rolls_2.json' in the interface.rb file to run another game demo.

![image](https://user-images.githubusercontent.com/111398626/214175458-5e42d64e-5ba1-47c5-aaee-9da185f4b93c.png)

* Have fun!

### Original Request Details
### Game rules
* There are four players who take turns in the following order:
  * Peter
  * Billy
  * Charlotte
  * Sweedal
* Each player starts with $16
* Everybody starts on GO
* You get $1 when you pass GO (this excludes your starting move)
* If you land on a property, you must buy it
* If you land on an owned property, you must pay rent to the owner
* If the same owner owns all property of the same colour, the rent is doubled
* Once someone is bankrupt, whoever has the most money remaining is the winner
* There are no chance cards, jail or stations
* The board wraps around (i.e. you get to the last space, the next space is the first space)


### Your task
* Load in the board from board.json
* Implement game logic as per the rules
* Load in the given dice rolls files and simulate the game
  * Who would win each game?
  * How much money does everybody end up with?
  * What spaces does everybody finish on?


The specifics and implementation of this code is completely up to you!

### What we are looking for:
* We are a Ruby house, however feel free to pick the language you feel you are strongest in.
* Code that is well thought out and tested
* Clean and readable code
* Extensibility should be considered
* A git commit-history would be preferred, with small changes committed often so we can see your approach

Please include a readme with any additional information you would like to include, including instructions on how to test and execute your code.  You may wish to use it to explain any design decisions.

Despite this being a small command line app, please approach this as you would a production problem using whatever approach to coding and testing you feel appropriate.
