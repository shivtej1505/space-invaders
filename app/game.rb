# frozen_string_literal: true

require 'gosu'
require_relative 'components/ship'
require_relative 'components/invader'

# TODO:
# 1. Implement rows & movements of invaders
# 2. Implement missile launch system from ship - done
# 3. Implement missile launch system from invaders - done
# 4. Score system
# 5. Game start/pause/end system
# 6. collision detection

class Game < Gosu::Window
  def initialize
    super(640, 480, false, 0.05)
    self.caption = 'Space Invaders'

    @ship = Ship.new

    @invaders = 1.upto(5).map { {vel_x: 10, x: 0, y: 0, invaders: []} }

    @invaders.each_with_index do |invader_row, idx|
      invader_row[:invaders] = 1.upto(10).map { |num| Invader.new(x: num * 30, y: idx * 30) }
    end

    @missiles = []
    @paused = false
    @font = Gosu::Font.new(20)
  end

  def update
    exit if Gosu.button_down? Gosu::KB_ESCAPE

    @paused = !@paused if Gosu.button_down? Gosu::KB_P

    unless @paused
      @ship.move_left if Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::GP_LEFT)
      @ship.move_right if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::GP_RIGHT)
      @ship.move_up if Gosu.button_down?(Gosu::KB_UP) || Gosu.button_down?(Gosu::GP_BUTTON_0)

      @missiles << @ship.fire if Gosu.button_down? Gosu::KB_SPACE

      # if Gosu.button_down? Gosu::KB_F
      #   @invaders.each do |invader|
      #     @missiles << invader.fire
      #   end
      # end

      @invaders.each do |invader_row|
        invader_row[:invaders].each(&:move)
        invader_row[:x] += invader_row[:vel_x]
        if invader_row[:x] > 480 || invader_row[:x] < 0
          invader_row[:invaders].each(&:reverse_x)
          invader_row[:vel_x] = -invader_row[:vel_x]
          if invader_row[:x] < 0
            invader_row[:invaders].each(&:move_y)
          end
        end
      end

      @missiles.each(&:move)
    end
  end

  def draw
    if @paused
      @font.draw_text('Paused', 100, 100, 1)
    else
      @ship.draw
      @invaders.each do |invader_row|
        invader_row[:invaders].each(&:draw)
      end

      @missiles.each(&:draw)
    end
  end
end
