module Iterm2mintty
  class Theme
    attr_accessor :components

    def initialize(components = Array.new)
      @components = components
    end
  end
end
