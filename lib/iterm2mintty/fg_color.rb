class Iterm2mintty::FGColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable
  attr_reader :color

  def initialize(color:)
    @color = color
  end

  def name
    "ForegroundColour"
  end
end
