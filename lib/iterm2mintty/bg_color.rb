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
