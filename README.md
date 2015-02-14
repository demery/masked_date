# MaskedDate

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'masked_date'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install masked_date

## Usage

```ruby
require 'masked_date'

date = MaskedDate::Date.new y: 2012, m: 3, d: 15
date.to_s                       # => 2012-Mar-15

date = MaskedDate::Date.new y: 2012, m: 3
date.to_s                       # => 2012-Mar

date = MaskedDate::Date.new y: 2012
date.to_s                       # => 2012

date = MaskedDate::Date.new m: 3, d: 15
date.to_s                       # => Mar-15
```


## Development

After checking out the repo, run `bin/setup` to install
dependencies. Then, run `bin/console` for an interactive prompt that
will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release` to create a git
tag for the version, push git commits and tags, and push the `.gem`
file to [rubygems.org](https://rubygems.org).


To try the code, build and install the gem:

```bash
bundle exec rake install
masked_date 0.1.0 built to pkg/masked_date-0.1.0.gem.
masked_date (0.1.0) installed.
```

Then use `create_date.rb` test script:

```bash
bundle exec bin/create_date.rb 2014
2014
bundle exec bin/create_date.rb 2014-3
2014-Mar
bundle exec bin/create_date.rb 2014-3-15
2014-Mar-15
bundle exec bin/create_date.rb -3-15
Mar-15
bundle exec bin/create_date.rb --1
01
bundle exec bin/create_date.rb --

```
