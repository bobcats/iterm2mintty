require "helper"
require "iterm2mintty/cli"

module Iterm2mintty
  class CLITest < Minitest::Unit::TestCase
    def test_run
      io = Minitest::Mock.new
      args = ["test/fixtures/Hybrid.itermcolors"]

      io.expect(:puts, String.new, [String])
      io.expect(:autoclose?, false)

      CLI.new(args, io: io).run
    end
  end
end
