# Rubosquad

[![Gem Version](https://badge.fury.io/rb/rubosquad.svg)](https://badge.fury.io/rb/rubosquad)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Rubosquad is a Ruby gem that streamlines your code review process by automatically running RuboCop on changed files in a Git repository. It helps maintain code quality and consistency by checking and auto-correcting style issues in modified Ruby files.

## Features

- 🔍 Automatically detects changed Ruby files in your Git repository
- 🚀 Runs RuboCop with auto-correct option on changed files
- 🧩 Supports multiple RuboCop extensions:
  - rubocop-factory_bot
  - rubocop-rails
  - rubocop-rspec
  - rubocop-rspec_rails
- 🎨 Provides colorized and formatted output for easy reading
- 📊 Summarizes total offenses and files inspected

## Installation

Add this line to your application's Gemfile:
gem 'rubosquad'


## Configuration

Rubosquad uses your project's existing RuboCop configuration. Ensure you have a `.rubocop.yml` file in your project root to customize RuboCop's behavior.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cw-lucaswaki/rubosquad. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

1. Fork it ( https://github.com/cw-lucaswaki/rubosquad/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rubosquad project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).