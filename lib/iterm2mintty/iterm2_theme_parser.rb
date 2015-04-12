require "iterm2mintty/theme_component"
require "plist"

module Iterm2mintty
  class Iterm2ThemeParser
    attr_reader :itermcolors

    def initialize(itermcolors)
      @itermcolors = itermcolors
    end

    def build
      parsed_theme.map do |k, v|
        case k
        when /Ansi (\d+) Color/
          ThemeComponent.ansi(Integer($1))
        when "Background Color"
          BGColorComponent
        when "Foreground Color"
          FGColorComponent
        when "Cursor Color"
          CursorColorComponent
        else
          # TODO(bobcats): Probably good candidate for NullComponent
          next
        end.new(red(v), green(v), blue(v))
      end.compact
    end

    def red(value)
      Integer(value.fetch("Red Component").to_f * 255)
    end

    def green(value)
      Integer(value.fetch("Green Component").to_f * 255)
    end

    def blue(value)
      Integer(value.fetch("Blue Component").to_f * 255)
    end

    def parsed_theme
      Plist.parse_xml(itermcolors)
    end
  end
end
