class Iterm2mintty::Theme
  attr_reader :components

  def initialize(components = Array.new)
    @components = components
  end
end
