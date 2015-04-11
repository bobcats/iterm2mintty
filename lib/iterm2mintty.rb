require "iterm2mintty/version"
require "iterm2mintty/mintty_theme"
require "iterm2mintty/iterm2_theme"

class Iterm2mintty
  attr_reader :pathname

  def self.convert(pathname)
    new(pathname).convert
  end

  def initialize(pathname)
    @pathname = pathname
  end

  def convert
    Iterm2mintty::MinttyTheme.new(iterm2_theme.components).output
  end

  private

  def iterm2_theme
    Iterm2mintty::Iterm2Theme.from_file(pathname)
  end
end
