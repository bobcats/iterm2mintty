require "iterm2mintty/theme"

class Iterm2mintty::MinttyTheme < Iterm2mintty::Theme
  def output
    output_lines.join("\n") + "\n"
  end

  def output_lines
    components.map do |component|
      component_to_config(component)
    end
  end

  def component_to_config(component)
    "#{key_for(component.class)}= #{component.red}, #{component.green}, #{component.blue}"
  end

  def key_for(component_class)
    {
      Iterm2mintty::BlackComponent => "Black",
      Iterm2mintty::RedComponent => "Red",
      Iterm2mintty::GreenComponent => "Green",
      Iterm2mintty::YellowComponent => "Yellow",
      Iterm2mintty::BlueComponent => "Blue",
      Iterm2mintty::MagentaComponent => "Magenta",
      Iterm2mintty::CyanComponent => "Cyan",
      Iterm2mintty::WhiteComponent => "White",
      Iterm2mintty::BoldBlackComponent => "BoldBlack",
      Iterm2mintty::BoldRedComponent => "BoldRed",
      Iterm2mintty::BoldGreenComponent => "BoldGreen",
      Iterm2mintty::BoldYellowComponent => "BoldYellow",
      Iterm2mintty::BoldBlueComponent => "BoldBlue",
      Iterm2mintty::BoldMagentaComponent => "BoldMagenta",
      Iterm2mintty::BoldCyanComponent => "BoldCyan",
      Iterm2mintty::BoldWhiteComponent => "BoldWhite",
      Iterm2mintty::BGColorComponent => "BackgroundColour",
      Iterm2mintty::FGColorComponent => "ForegroundColour",
      Iterm2mintty::CursorColorComponent => "CursorColour",
    }[component_class]
  end
end
