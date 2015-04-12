require "helper"
require "iterm2mintty/iterm2_theme_parser"

module Iterm2mintty
  class Iterm2ThemeParserTest < MiniTest::Test
    def setup
      itermcolors = Pathname.new("test/fixtures/Hybrid.itermcolors")
      @parser = Iterm2ThemeParser.new(itermcolors)
    end

    def test_build
      built_components = @parser.build
      components = [
        BlackComponent.new(42, 46, 51),
        RedComponent.new(183, 77, 80),
        BoldGreenComponent.new(120, 131, 49),
        BoldYellowComponent.new(229, 137, 79),
        BoldBlueComponent.new(75, 107, 136),
        BoldMagentaComponent.new(110, 79, 121),
        BoldCyanComponent.new(77, 123, 115),
        BoldWhiteComponent.new(90, 97, 105),
        GreenComponent.new(179, 190, 90),
        YellowComponent.new(227, 181, 94),
        BlueComponent.new(109, 144, 176),
        MagentaComponent.new(160, 126, 171),
        CyanComponent.new(127, 190, 179),
        WhiteComponent.new(181, 184, 182),
        BoldBlackComponent.new(29, 30, 33),
        BoldRedComponent.new(140, 45, 50),
        BGColorComponent.new(22, 23, 24),
        CursorColorComponent.new(183, 188, 185),
        FGColorComponent.new(183, 188, 185),
      ]

      assert_equal components, built_components
    end

    def test_red
      red = @parser.red({"Red Component" => "1.0"})
      assert_equal red, 255
    end

    def test_green
      green = @parser.green({"Green Component" => "1.0"})
      assert_equal green, 255
    end

    def test_blue
      blue = @parser.blue({"Blue Component" => "1.0"})
      assert_equal blue, 255
    end
  end
end
