# Ortega

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ortega.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
