# ObjectSpaceDiff

Lists new objects left in global ObjectSpace after yielding a block

## Installation

Add this line to your application's Gemfile:

    gem 'object_space_diff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install object_space_diff

## Usage

use as module method:
ObjectSpaceDiff.puts_changes(target=$stdout)
or
include ObjectSpaceDiff in your code and use instance method as needed.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
