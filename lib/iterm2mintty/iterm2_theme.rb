require "iterm2mintty/theme"
require "iterm2mintty/iterm2_theme_parser"

class Iterm2mintty::Iterm2Theme < Iterm2mintty::Theme
  def self.from_file(itermcolors)
    new(
      Iterm2mintty::Iterm2ThemeParser.new(itermcolors).build
    )
  end
end

