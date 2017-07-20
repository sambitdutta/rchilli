# Rchilli

RChilli provides CV/ Resume Parser, Semantic matching engine, Social profile builder. End to end CV Automation tools.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rchilli'
```

And then execute:

    $ bundle

Generate a default configuration file:

    $ rails g rchilli:install

## Usage

To parse a resume, execute the following statement:

```ruby
Rchilli::Client.parse_resume_binary binary_content, file_name	
#The variable binary_content should contain Base64 encoded content of the resume to be parsed
#file_content should contain the file name as a string literal
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rchilli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# rchilli
