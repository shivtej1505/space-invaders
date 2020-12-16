# frozen_string_literal: true

class Invader
  def initialize(x: 0.0, y: 0.0)
    @image = Gosu::Image.new('app/assets/images/invader.png')
    @x = x
    @y = y
    @vel_x = 10
    @vel_y = 0.0
  end

  def move
    @x += @vel_x
    @y += @vel_y
  end

  def reverse_x
    @vel_x = -@vel_x
  end

  def move_y
    @y += 20
  end

  def fire
    Missile.new(x: @x, y: @y, vel_y: 1)
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
