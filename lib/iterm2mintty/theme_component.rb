class Iterm2mintty::ThemeComponent < Struct.new(:red, :green, :blue)
  def self.ansi(index)
    [
      Iterm2mintty::BlackComponent,
      Iterm2mintty::RedComponent,
      Iterm2mintty::GreenComponent,
      Iterm2mintty::YellowComponent,
      Iterm2mintty::BlueComponent,
      Iterm2mintty::MagentaComponent,
      Iterm2mintty::CyanComponent,
      Iterm2mintty::WhiteComponent,
      Iterm2mintty::BoldBlackComponent,
      Iterm2mintty::BoldRedComponent,
      Iterm2mintty::BoldGreenComponent,
      Iterm2mintty::BoldYellowComponent,
      Iterm2mintty::BoldBlueComponent,
      Iterm2mintty::BoldMagentaComponent,
      Iterm2mintty::BoldCyanComponent,
      Iterm2mintty::BoldWhiteComponent,
    ][index]
  end
end

class Iterm2mintty::BlackComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::RedComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::GreenComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::YellowComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BlueComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::MagentaComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::CyanComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::WhiteComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldBlackComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldRedComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldGreenComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldYellowComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldBlueComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldMagentaComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldCyanComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BoldWhiteComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::BGColorComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::FGColorComponent < Iterm2mintty::ThemeComponent; end
class Iterm2mintty::CursorColorComponent < Iterm2mintty::ThemeComponent; end
