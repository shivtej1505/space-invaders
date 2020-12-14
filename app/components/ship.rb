require_relative 'missile'

class Ship
  def initialize
    @image = Gosu::Image.new("app/assets/images/rocket.png")
    @x = @y = 240
    @vel_x = @vel_y = 1
  end

  def move_left
    @x -= @vel_x
  end

  def move_right
    @x += @vel_x
  end

  def move_up
    @y -= @vel_y
  end

  def move_down
    @y += @vel_y
  end

  def fire
    Missile.new(x: @x, y: @y, vel_y: -1)
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
