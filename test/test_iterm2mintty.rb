require "minitest/autorun"
require "iterm2mintty"
require "pathname"

class Iterm2minttyTest < MiniTest::Test
  def setup
    pathname = Pathname.new("test/Hybrid.itermcolors")
    @i22m = Iterm2mintty.new(pathname)
  end

  def test_convert
    minttyrc =
      <<-MINTTYRC
Black= 42, 46, 51
Red= 183, 77, 80
BoldGreen= 120, 131, 49
BoldYellow= 229, 137, 79
BoldBlue= 75, 107, 136
BoldMagenta= 110, 79, 121
BoldCyan= 77, 123, 115
BoldWhite= 90, 97, 105
Green= 179, 190, 90
Yellow= 227, 181, 94
Blue= 109, 144, 176
Magenta= 160, 126, 171
Cyan= 127, 190, 179
White= 181, 184, 182
BoldBlack= 29, 30, 33
BoldRed= 140, 45, 50
BackgroundColour= 22, 23, 24
CursorColour= 183, 188, 185
ForegroundColour= 183, 188, 185
    MINTTYRC

    assert_equal minttyrc, @i22m.convert
  end
end

class Iterm2mintty
  class ANSIColorTest < MiniTest::Test
    def setup
      @black = ANSIColor.new(number: 0, color: Color.new(0, 0, 0))
    end

    def test_name
      assert_equal "Black", @black.name
    end

    def test_to_mintty
      assert_equal "Black= 0, 0, 0", @black.to_mintty
    end
  end
end
