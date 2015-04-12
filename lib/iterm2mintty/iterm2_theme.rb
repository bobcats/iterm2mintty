require "iterm2mintty/theme"
require "iterm2mintty/iterm2_theme_parser"

module Iterm2mintty
  class Iterm2Theme < Theme
    def from_source(itermcolors)
      @components = Iterm2ThemeParser.new(itermcolors).build
      self
    end
  end
end

