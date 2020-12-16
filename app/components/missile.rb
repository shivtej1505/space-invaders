# frozen_string_literal: true

class Missile
  def initialize(x:, y:, vel_y:)
    @image = Gosu::Image.new('app/assets/images/rocket.png')
    @x = x
    @y = y
    @vel_y = vel_y
  end

  def move
    @y += @vel_y
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
