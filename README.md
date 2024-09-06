# Rubosquad

[![Gem Version](https://badge.fury.io/rb/rubosquad.svg)](https://badge.fury.io/rb/rubosquad)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Rubosquad is a Ruby gem that streamlines your code review process by automatically running RuboCop on changed files in a Git repository. It helps maintain code quality and consistency by checking and auto-correcting style issues in modified Ruby files.

## 🌟 Features

- 🔍 Automatically detects changed Ruby files in your Git repository
- 🚀 Runs RuboCop with auto-correct option on changed files
- 🧩 Supports multiple RuboCop extensions:
  - rubocop-factory_bot
  - rubocop-rails
  - rubocop-rspec
  - rubocop-rspec_rails
- 🎨 Provides colorized and formatted output for easy reading
- 📊 Summarizes total offenses and files inspected

## 📦 Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubosquad'
```

Then run:

```bash
bundle install
```

## 🛠 Usage

Run Rubosquad from your project's root directory:

```bash
rubosquad
```

This command will:
1. Identify Ruby files that have changed compared to the `main` branch
2. Run RuboCop on these files with auto-correct enabled
3. Apply auto-corrections where possible
4. Display a summary of offenses and corrections

### Example Output

```
Running RuboCop on 3 files...

Inspecting 3 files
...

3 files inspected, no offenses detected
```

## ⚙️ Configuration

Rubosquad uses your project's existing RuboCop configuration. Ensure you have a `.rubocop.yml` file in your project root to customize RuboCop's behavior.

## ⚠️ Important Notes

### Caution with Auto-corrections

- The `rubocop -A` command applies auto-corrections to the entire file.
- Be cautious when using this feature, especially on large files:
  - Even if you've changed only one line in a 10,000-line file, RuboCop will enforce changes throughout the entire file.
- This behavior is due to how Rubosquad identifies changed files:
  - It uses `git diff --name-only main | grep '\.rb$'` to find modified Ruby files.
  - Then it runs `rubocop -A` on these files.

### Best Practices

1. Review changes carefully before committing.
2. Consider using `rubocop -a` (safe auto-correct) instead of `-A` for more conservative corrections.
3. Run Rubosquad on a clean working directory to avoid unintended changes.
4. Use version control and commit frequently to easily revert unwanted changes.

### Customization

You can modify Rubosquad's behavior by editing the script. The core functionality is located in: `lib/rubosquad.rb`

Consider adding options to:
- Choose between `-a` and `-A` auto-correct modes.
- Limit the number of lines affected in large files.
- Provide a dry-run option to preview changes without applying them.

For more information on RuboCop's auto-correct modes, refer to the [official RuboCop documentation](https://docs.rubocop.org/rubocop/usage/auto_correct.html).

## 🚀 Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cw-lucaswaki/rubosquad. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

1. Fork it ( https://github.com/cw-lucaswaki/rubosquad/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## 📜 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## 🤝 Code of Conduct

Everyone interacting in the Rubosquad project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).