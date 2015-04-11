require "iterm2mintty/theme"

module Iterm2mintty
  class MinttyTheme < Theme
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
        BlackComponent => "Black",
        RedComponent => "Red",
        GreenComponent => "Green",
        YellowComponent => "Yellow",
        BlueComponent => "Blue",
        MagentaComponent => "Magenta",
        CyanComponent => "Cyan",
        WhiteComponent => "White",
        BoldBlackComponent => "BoldBlack",
        BoldRedComponent => "BoldRed",
        BoldGreenComponent => "BoldGreen",
        BoldYellowComponent => "BoldYellow",
        BoldBlueComponent => "BoldBlue",
        BoldMagentaComponent => "BoldMagenta",
        BoldCyanComponent => "BoldCyan",
        BoldWhiteComponent => "BoldWhite",
        BGColorComponent => "BackgroundColour",
        FGColorComponent => "ForegroundColour",
        CursorColorComponent => "CursorColour",
      }[component_class]
    end
  end
end
