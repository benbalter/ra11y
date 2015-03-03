# Ra11y

[![Gem Version](https://badge.fury.io/rb/ra11y.svg)](http://badge.fury.io/rb/ra11y) [![Build Status](https://travis-ci.org/benbalter/ra11y.svg)](https://travis-ci.org/benbalter/ra11y)

Ruby-based automated accessibility testing for Jekyll and other static sites


## Requirements

Ra11y requires Pa11y or a similar command-line accessibility testing tool. To install Pa11y:

`npm install -g pa11y`

## Installation

Add this line to your application's Gemfile:

    gem 'ra11y'

And then execute:

    $ bundle

## Usage with Jekyll

Add the following to a `Rakefile`:

```ruby
require 'ra11y'

task :test do
  sh "bundle exec jekyll build"
  Ra11y::Site.new("./_site").run
end
```

Then run `bundle exec rake test`

### Build failure criteria

By default, ra11y will just print information to STDOUT. However, you can configure it to `exit 1` which will "break" the build. Pass a `Proc` that returns `true` for failure into `Ra11y::Site#new`:

```ruby
options = {
  failure: Proc.new do |warnings, errors|
    warnings.length > 20 || errors.length > 10
  end
}
Ra11y::Site.new("./_site", options).run
```

This means that if the `ra11y` finds more than 20 warnings _or_ more than 10 errors, the build will fail. Of course, you can customize this `Proc` however you want.

## Usage with Travis-CI

If you're using pa11y, ensure you have this line in your `.travis.yml` file:
```yaml
before_script: npm install -g pa11y
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ra11y/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
