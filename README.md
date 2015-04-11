# Iterm2mintty

Still very very very much a work in progress. Converts existing iterm2 colorscheme into a mintty
compatible one.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iterm2mintty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iterm2mintty

## Usage

Iterm2mintty default writes to stdout. To use, try:

```
iterm2mintty somecolorscheme.itermcolors
```

Or maybe even:

```
iterm2mintty somecolorscheme.itermcolors > .minttyrc
```

If you'd like to write the output to a file, use the `-o` flag (defaults to .minttyrc)

```
iterm2mintty somecolorscheme.itermcolors -o some/path/to/.minttyrc
```

## Contributing

1. Fork it ( https://github.com/bobcats/iterm2mintty/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
