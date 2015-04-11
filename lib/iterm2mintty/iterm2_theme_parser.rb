require "iterm2mintty/theme_component"
require "plist"

class Iterm2mintty::Iterm2ThemeParser
  attr_accessor :key, :value, :itermcolors

  def initialize(itermcolors)
    @itermcolors = itermcolors
  end

  def build
    parsed_theme.map do |k, v|
      @key = k
      @value = v

      case key
      when /Ansi (\d+) Color/
        Iterm2mintty::ThemeComponent.ansi(Integer($1))
      when "Background Color"
        Iterm2mintty::BGColorComponent
      when "Foreground Color"
        Iterm2mintty::FGColorComponent
      when "Cursor Color"
        Iterm2mintty::CursorColorComponent
      else
        next
      end.new(red, green, blue)
    end.compact
  end

  def red
    Integer(value["Red Component"] * 255)
  end

  def green
    Integer(value["Green Component"] * 255)
  end

  def blue
    Integer(value["Blue Component"] * 255)
  end

  def parsed_theme
    Plist.parse_xml(itermcolors)
  end
end
