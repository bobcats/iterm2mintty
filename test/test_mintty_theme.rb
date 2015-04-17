require "helper"
require "iterm2mintty/mintty_theme"

module Iterm2mintty
  class MinttyThemeTest < Minitest::Unit::TestCase
    def setup
      @components = [
        BlackComponent.new(0, 0, 0),
        RedComponent.new(170, 0, 0),
        GreenComponent.new(0, 170, 0),
        YellowComponent.new(170, 85, 0),
        BlueComponent.new(0, 0, 170),
        MagentaComponent.new(170, 0, 170),
        CyanComponent.new(0, 170, 170),
        WhiteComponent.new(170, 170, 170),
        BoldBlackComponent.new(85, 85, 85),
        BoldRedComponent.new(255, 85, 85),
        BoldGreenComponent.new(85, 255, 85),
        BoldYellowComponent.new(255, 255, 85),
        BoldBlueComponent.new(85, 85, 255),
        BoldMagentaComponent.new(255, 85, 255),
        BoldCyanComponent.new(85, 255, 255),
        BoldWhiteComponent.new(255, 255, 255),
        BGColorComponent.new(0, 0, 0),
        FGColorComponent.new(255, 255, 255),
        CursorColorComponent.new(255, 255, 255)
      ]

      @mintty_theme = MinttyTheme.new(@components)
    end

    def test_component_to_config
      output_line = MinttyTheme.new.component_to_config(@components.first)

      assert_equal output_line, "Black= 0, 0, 0"
    end

    def test_output
      output = <<-OUTPUT
Black= 0, 0, 0
Red= 170, 0, 0
Green= 0, 170, 0
Yellow= 170, 85, 0
Blue= 0, 0, 170
Magenta= 170, 0, 170
Cyan= 0, 170, 170
White= 170, 170, 170
BoldBlack= 85, 85, 85
BoldRed= 255, 85, 85
BoldGreen= 85, 255, 85
BoldYellow= 255, 255, 85
BoldBlue= 85, 85, 255
BoldMagenta= 255, 85, 255
BoldCyan= 85, 255, 255
BoldWhite= 255, 255, 255
BackgroundColour= 0, 0, 0
ForegroundColour= 255, 255, 255
CursorColour= 255, 255, 255
      OUTPUT

      assert_equal output, @mintty_theme.output
    end
  end
end
