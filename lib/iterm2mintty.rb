require "iterm2mintty/converter"

module Iterm2mintty
  def self.convert(source)
    Converter.new.call(source)
  end
end
