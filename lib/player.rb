class Player
  attr_accessor :name, :money, :position, :is_alive

  def initialize(name)
    @name = name
    @money = 16
    @position = 0
    @is_alive = true
  end

end


# * There are four players who take turns in the following order:
#   * Peter
#   * Billy
#   * Charlotte
#   * Sweedal
# * Each player starts with $16
# * Everybody starts on GO
