require "optparse"
require "pathname"
require "iterm2mintty"
require "iterm2mintty/version"

module Iterm2mintty
  class CLI
    attr_reader :args, :io, :source

    def self.run(args)
      new(args).run
    end

    def initialize(args, io: $stdout)
      @args = args
      @io = io
    end

    def run
      parse_options

      io.puts Iterm2mintty.convert(source)

      if io.close_on_exec?
        io.close
      end
    end

    def parse_options
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: iterm2mintty <source filepath> [options]"
        opts.separator ""
        opts.separator "Options:"

        opts.on(
          "-o",
          "--output [FILE]",
          "FILE to output theme to (defaults to .minttyrc)"
        ) do |path|
          path ||= ".minttyrc"
          @io = File.new(path, "w")
        end

        opts.on("-v", "--version", "Prints version of Iterm2mintty") do
          puts VERSION
          exit true
        end

        opts.on("-h", "--help", "Prints this help :)") do
          puts opts

          if io.close_on_exec?
            io.close
          end

          exit true
        end
      end

      parser.parse!(args)

      if args.empty?
        puts parser

        if io.close_on_exec?
          io.close
        end

        exit false
      else
        @source = Pathname.new(args.pop)

        unless @source.exist?
          puts "Source file \"#{@source}\" does not exist."
          exit false
        end
      end
    end
  end
end
