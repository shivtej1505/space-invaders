# frozen_string_literal: true

class Invader
  def initialize(x: 0.0, y: 0.0)
    @image = Gosu::Image.new('app/assets/images/invader.png')
    @x = x
    @y = y
    @vel_x = 1
    @vel_y = 0.0
  end

  def move
    @x += @vel_x
    @y += @vel_y
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
