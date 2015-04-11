require "iterm2mintty/version"
require "iterm2mintty/ansi_color"
require "iterm2mintty/bg_color"
require "iterm2mintty/fg_color"
require "iterm2mintty/cursor_color"

require "plist"

class Iterm2mintty
  attr_reader :pathname

  def initialize(pathname)
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
        ANSIColor.build(number: number, rgb: [red, green, blue])
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
