class Player

  attr_accessor :lives, :name

  @@count = 0

  def initialize
    @@count += 1
    @name = "Player #{@@count}"
    @lives = 3
  end

  def lose
    @lives -= 1
  end

end