require 'gosu'
require_relative 'components/ship'

class Game < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = "Space Invaders"

    @ship = Ship.new
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @ship.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @ship.move_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @ship.move_up
    end
  end

  def draw
    @ship.draw
  end
end
