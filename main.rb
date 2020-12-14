require 'gosu'

class Main < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = "Space Invaders"
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end

Main.new.show
