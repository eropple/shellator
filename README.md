# Shellator
Shelling out in Ruby is way harder than it should be. Shellator, which is in
part a gem _just because it's a good name_, wraps `Open.popen3` in a consistent,
mostly-not-dumb way.

I've been dragging around a variant of [this blog post]() for about three years
now and finally, _finally_, I have shamed myself into packaging it as a library
for use by friends, enemies, minions, and miscellaneous alike.

Enjoy.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'shellator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shellator

## Usage
### Non-interactive commands ###
```
require 'shellator'

Shellator.noninteractive("docker build .",
                         stdout: ->(line) { puts line },
                         stderr: ->(line) { puts line })

```



### Interactive commands ###
Not currently supported. I'd like to figure out a way to weld the `popen3`
approach

## Development
After checking out the repo, run `bin/setup` to install dependencies. You can
also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at
https://github.com/eropple/shellator. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the Shellator project’s codebases, issue trackers, chat
rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/eropple/shellator/blob/master/CODE_OF_CONDUCT.md).

[this blog post]: https://nickcharlton.net/posts/ruby-subprocesses-with-stdout-stderr-streams.html
