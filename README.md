## aftership-ruby

[![Build Status](https://travis-ci.org/AfterShip/aftership-sdk-ruby.svg?branch=master)](https://travis-ci.org/AfterShip/aftership-sdk-ruby)
[![Code Climate](https://codeclimate.com/github/AfterShip/aftership-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/AfterShip/aftership-sdk-ruby)
[![Gem Version](https://badge.fury.io/rb/aftership.svg)](https://badge.fury.io/rb/aftership)
[![Dependency Status](https://gemnasium.com/badges/github.com/AfterShip/aftership-sdk-ruby.svg)](https://gemnasium.com/github.com/AfterShip/aftership-sdk-ruby)
[![Coverage Status](https://coveralls.io/repos/github/AfterShip/aftership-sdk-ruby/badge.svg?branch=master)](https://coveralls.io/github/AfterShip/aftership-sdk-ruby?branch=master)
[![Documentation status](https://inch-ci.org/github/AfterShip/aftership-sdk-ruby.svg?branch=master)](https://inch-ci.org/github/AfterShip/aftership-sdk-ruby)


Ruby Gem for Aftership API.

This extension helps developers to integrate with Aftership easily.

## Resources

- <a href="https://www.aftership.com/docs/api/4/overview"> API documentation/overview</a>
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

Aftership.configure do |config|
  config.api_key = 'YOUR API KEY' # Required
  config.endpoint = 'http://my-custom-endpoint.example.com' # Optionally set custom endpoint url.
end

```

You can also set your endpoint url via ENV variable:

```
AFTERSHIP_API_ENDPOINT='http://my-custom-endpoint.example.com' bundle console
2.3.3 :001 > AfterShip.endpoint
 => "http://my-custom-endpoint.example.com"
 ```


## Getting started

```ruby
require 'aftership'

# Setup your Aftership account (https://secure.aftership.com/login/), obtain an API key.
# Configure your API key, see Configuration section

### Fetch all trackings

Aftership::Tracking.all

```

## The License (MIT)

Released under the MIT license. See the LICENSE file for the complete wording.
