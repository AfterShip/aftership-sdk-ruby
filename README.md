## aftership-ruby

[![Build Status](https://travis-ci.org/aftership/aftership-sdk-ruby.svg?branch=master)](https://travis-ci.org/aftership/aftership-sdk-ruby)
[![Code Climate](https://codeclimate.com/github/postmen/postmen-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/aftership/aftership-sdk-ruby)
[![Gem Version](https://badge.fury.io/rb/aftership.svg)](https://badge.fury.io/rb/aftership)
[![Dependency Status](https://gemnasium.com/badges/github.com/aftership/aftership-sdk-ruby.svg)](https://gemnasium.com/github.com/aftership/aftership-sdk-ruby)
[![Coverage Status](https://coveralls.io/repos/github/aftership/aftership-sdk-ruby/badge.svg?branch=master)](https://coveralls.io/github/aftership/aftership-sdk-ruby?branch=master)
[![Documentation status](https://inch-ci.org/github/aftership/aftership-sdk-ruby.svg?branch=master)](https://inch-ci.org/github/aftership/aftership-sdk-ruby)


Ruby Gem for Aftership API.

This extension helps developers to integrate with Aftership easily.

## Resources

- <a href="https://docs.postmen.com"> API documentation/overview</a>
- <a href="http://www.rubydoc.info/github/aftership/aftership-sdk-ruby">Ruby technical documentation</a>


## Installation

1. Add the following line to your application's Gemfile

    ```
    gem 'aftership', '~> 5.0'
    ```

2. Run bundler

    ```
    bundle install
    ```

## Configuration

```ruby

Aftership.api_key = 'YOUR API KEY' # set your api key

```

## Getting started

```ruby
require 'aftership'

# Setup your postmen account (https://postmen.com), obtain an API key.
# Configure Postmen, see Configuration section

### Fetch all trackings

Aftership::Tracking.all

```

## The License (MIT)

Released under the MIT license. See the LICENSE file for the complete wording.
