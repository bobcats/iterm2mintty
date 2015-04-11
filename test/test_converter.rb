require "helper"
require "iterm2mintty/converter"

module Iterm2mintty
  class ConverterTest < MiniTest::Test
    def setup
      @to = MiniTest::Mock.new
      @from = MiniTest::Mock.new
      @source = MiniTest::Mock.new
      @theme_components = [ThemeComponent.new]

      @converter = Converter.new(to: @to, from: @from)
    end

    def test_call
      @to.expect(:output, String.new)
      @to.expect(:components=, @to, [@theme_components])

      @from.expect(:components, @theme_components)
      @from.expect(:from_source, @from, [@source])

      @converter.call(@source)

      assert @to.verify
      assert @from.verify
    end
  end
end
