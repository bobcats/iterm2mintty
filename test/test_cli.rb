require "helper"
require "iterm2mintty/cli"

module Iterm2mintty
  class CLITest < MiniTest::Test
    def test_run
      io = MiniTest::Mock.new
      args = ["test/fixtures/Hybrid.itermcolors"]

      io.expect("puts", String.new, [String])
      io.expect("close_on_exec?", false)

      CLI.new(args, io: io).run
    end
  end
end
