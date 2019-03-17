# Ortega [![Gem Version](https://badge.fury.io/rb/ortega.svg)](https://badge.fury.io/rb/ortega)

Ruby file downloader

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ortega'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ortega

## Usage

```ruby
  require 'ortega'

  Ortega.download('example.com/downloadable_file.pdf')
  # Output
  # Downloading downloadable_file.pdf
  ############                                                      12 %
```

You can specify target path, file name and its extension by passing arguments

Example

```ruby
Ortega.download('example.com/downloadable_file.pdf', name: 'my_file.pdf', path: '~/Desktop')
```
If you want to hide progress bar, set ```bar``` option to false

```ruby
Ortega.download('example.com/downloadable_file.pdf', bar: false)
```

If url does not contain the extension, it should be good to spectify it manually as:
```ruby
Ortega.download('example.com/downloadable_file', extension: 'pdf')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ortega.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
