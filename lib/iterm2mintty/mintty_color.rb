module Iterm2mintty::MinttyColor
  def to_mintty
    "#{name}= #{red}, #{green}, #{blue}"
  end
end
