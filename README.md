# Rchilli

RChilli provides CV/Resume Parser, Semantic matching engine, Social profile builder. End to end CV Automation tools.

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

To parse a resume using Rchilli enrichment feature, execute the following statement:

Note: Also provide a valid Webhook URL in the config file. Rchilli would access this URL from time to time depending on your settings in rchilli.yml to update the details of the candidate specified in the resume you have uploaded. 

```ruby
Rchilli::Client.process_resume binary_content, file_name	
#The variable binary_content should contain Base64 encoded content of the resume to be parsed
#file_content should contain the file name as a string literal
```
To deactivate an uploaded resume, run the following command:

```ruby
Rchilli::Client.deactivate_resume resume_id	
#The variable resume_id should contain the resume id provided in the response of the earlier statement 
```

Failure to parse CV/Resume would raise an exception of Rchilli::ParseError class.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rchilli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

