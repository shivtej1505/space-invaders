require 'gosu'
require_relative 'components/ship'
require_relative 'components/invader'

# TODO:
# 1. Implement rows & movements of invaders
# 2. Implement missile launch system from ship
# 3. Implement missile launch system from invaders
# 4. Score system
# 5. Game start/pause/end system
# 6. collision detection

class Game < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = "Space Invaders"

    @ship = Ship.new
    @invaders = 1.upto(10).map {|num| Invader.new(x: num*30) }
    @missiles = []
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

    if Gosu.button_down? Gosu::KB_ESCAPE
      exit
    end

    if Gosu.button_down? Gosu::KB_SPACE
      @missiles << @ship.fire
    end

    @invaders.each do |invader|
      invader.move
    end

    @missiles.each do |missile|
      missile.move
    end
  end

  def draw
    @ship.draw
    @invaders.each do |invader|
      invader.draw
    end

    @missiles.each do |missile|
      missile.draw
    end
  end
end
