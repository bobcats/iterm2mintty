require "iterm2mintty/mintty_color"
require "iterm2mintty/colorable"
require "iterm2mintty/color"

class Iterm2mintty::ANSIColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable

  attr_reader :number, :color

  NAMES = %w(
    Black     Red     Green     Yellow     Blue     Magenta     Cyan     White
    BoldBlack BoldRed BoldGreen BoldYellow BoldBlue BoldMagenta BoldCyan BoldWhite
  )

  def self.build(number:, rgb:)
    new(number: number, color: Iterm2mintty::Color.new(*rgb))
  end

  def initialize(number:, color:)
    @number = number
    @color = color
  end

  def name
    NAMES[number]
  end
end

