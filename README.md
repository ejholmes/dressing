# Dressing

> A lighter weight alternative to sauce.

Dressing is a Ruby gem for running [Capybara](https://github.com/jnicklas/capybara) scenarios with [Sauce Labs](https://saucelabs.com).
It's an alternative to the official `sauce` gem, which is clunky and difficult to use.

## Usage

### RSpec + Capybara

```ruby
require 'dressing/rspec'
```

That's it, you're done. Each test will be run in it's own VM on Sauce Labs and you'll be able to see whether
the test failed or past in the Sauce Labs UI.

## Configuration

```ruby
Dressing.configure do |config|
  config.browser = 'Chrome'
  config.os = 'Windows 7'
  config.version = 27

  config.tunnel_identifier = ENV['TRAVIS_JOB_NUMBER']
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
