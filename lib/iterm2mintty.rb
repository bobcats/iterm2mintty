require "iterm2mintty/version"
require "plist"

class Iterm2mintty
  attr_reader :pathname, :ansi_colors

  def initialize(pathname:)
    @pathname = pathname
  end

  def convert
    ansi_colors.map do |color|
      color.to_mintty + "\n"
    end.join
  end

  def ansi_colors
    parsed_theme.map do |k, v|
      red = Integer(v["Red Component"] * 255)
      green = Integer(v["Green Component"] * 255)
      blue = Integer(v["Blue Component"] * 255)
      color = Color.new(red, green, blue)

      case k
      when /Ansi/
        number = Integer(k.match(/\d+/)[0])
        ANSIColor.new(number: number, color: color)
      when "Background Color"
        BGColor.new(color: color)
      when "Foreground Color"
        FGColor.new(color: color)
      when "Cursor Color"
        CursorColor.new(color: color)
      end
    end.compact
  end

  def parsed_theme
    Plist.parse_xml(pathname)
  end
end

module Iterm2mintty::MinttyColor
  def to_mintty
    "#{name}= #{red}, #{green}, #{blue}"
  end
end

module Iterm2mintty::Colorable
  def red
    color.r
  end

  def green
    color.g
  end

  def blue
    color.b
  end
end

class Iterm2mintty::ANSIColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable

  attr_reader :number, :color

  NAMES = %w(
    Black     Red     Green     Yellow     Blue     Magenta     Cyan     White
    BoldBlack BoldRed BoldGreen BoldYellow BoldBlue BoldMagenta BoldCyan BoldWhite
  )

  def initialize(number:, color:)
    @number = number
    @color = color
  end

  def name
    NAMES[number]
  end
end

class Iterm2mintty::FGColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable
  attr_reader :color

  def initialize(color:)
    @color = color
  end

  def name
    "ForegroundColour"
  end
end

class Iterm2mintty::BGColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable
  attr_reader :color

  def initialize(color:)
    @color = color
  end

  def name
    "BackgroundColour"
  end
end

class Iterm2mintty::CursorColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable
  attr_reader :color

  def initialize(color:)
    @color = color
  end

  def name
    "CursorColour"
  end
end

class Iterm2mintty::Color < Struct.new(:r, :g, :b)
end
