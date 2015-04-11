class Iterm2mintty::CursorColor
  include Iterm2mintty::MinttyColor
  include Iterm2mintty::Colorable
  attr_reader :color

  def initialize(color:)
    @color = color
  end

  def name
    "CursorColour"
  end
end
