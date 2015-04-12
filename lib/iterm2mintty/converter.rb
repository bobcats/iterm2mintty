require "iterm2mintty/mintty_theme"
require "iterm2mintty/iterm2_theme"

module Iterm2mintty
  class Converter
    attr_reader :to, :from

    def initialize(to: MinttyTheme.new, from: Iterm2Theme.new)
      @to   = to
      @from = from
    end

    def call(source)
      to.components = from.from_source(source).components
      to.output
    end
  end
end
