module Iterm2mintty
  class ThemeComponent < Struct.new(:red, :green, :blue)
    def self.ansi(index)
      [
        BlackComponent,
        RedComponent,
        GreenComponent,
        YellowComponent,
        BlueComponent,
        MagentaComponent,
        CyanComponent,
        WhiteComponent,
        BoldBlackComponent,
        BoldRedComponent,
        BoldGreenComponent,
        BoldYellowComponent,
        BoldBlueComponent,
        BoldMagentaComponent,
        BoldCyanComponent,
        BoldWhiteComponent,
      ][index]
    end
  end

  class BlackComponent < ThemeComponent; end
  class RedComponent < ThemeComponent; end
  class GreenComponent < ThemeComponent; end
  class YellowComponent < ThemeComponent; end
  class BlueComponent < ThemeComponent; end
  class MagentaComponent < ThemeComponent; end
  class CyanComponent < ThemeComponent; end
  class WhiteComponent < ThemeComponent; end
  class BoldBlackComponent < ThemeComponent; end
  class BoldRedComponent < ThemeComponent; end
  class BoldGreenComponent < ThemeComponent; end
  class BoldYellowComponent < ThemeComponent; end
  class BoldBlueComponent < ThemeComponent; end
  class BoldMagentaComponent < ThemeComponent; end
  class BoldCyanComponent < ThemeComponent; end
  class BoldWhiteComponent < ThemeComponent; end
  class BGColorComponent < ThemeComponent; end
  class FGColorComponent < ThemeComponent; end
  class CursorColorComponent < ThemeComponent; end
end
