## aftership-ruby

Ruby Gem for AfterShip API.

This extension helps developers to integrate with AfterShip easily.

## About AfterShip

AfterShip provides an automated way for online merchants to track packages and send their customers delivery status notifications. Customers no longer need to deal with tracking numbers and track packages on their own. With AfterShip, online merchants extend their customer service after the point of purchase by keeping their customers actively informed, while saving time and money by reducing customers’ questions about the status of their purchase delivery.

## Migration to 4.5.2+

We suggest all users to upgrade your `aftership` gem to v4.5.2 as any earlier versions are NOT maintained, which also means you will need to upgrade your ruby version to at least 2.3.0 to be able to use `faraday` the new http client of the revamped `aftership` gem.

If you want to use recent versions of Faraday, update your Gemfile as below:

```ruby
gem "aftership", "~> 4.5.2"
gem 'faraday', '~> 1.3.0'
```

### Changes
* 2021-02-08 4.5.2
  - Merged [#39](https://github.com/AfterShip/aftership-sdk-ruby/pull/39): Add compatibility for recent versions of Faraday

* 2021-02-08 4.5.1
  - Resolved [#31](https://github.com/AfterShip/aftership-sdk-ruby/issues/31): Deprecation of encryption algorithms below 256 bits

* 2021-02-08 4.5.0
  - Downgraded `faraday` to `1.0.1` that accepts ruby 2.3.0+ as required version.
  - Updated request User agent to follow AfterShip SDK guideline.
  - Required ruby version is now 2.3.0+

* 2021-02-08 4.4.0
  - Removed `httpclient` and used `faraday` 1.3 as http client
  - Polished project with prettified formatting
  - Required ruby version updated to 2.4.0+

* 2016-01-11 4.3.1
  - Updated gem `httpclient` version to 2.7.1

* 2015-12-14 4.3.0
  - Added rescue methods for parsing JSON, and try to retrieve error codes from cloudflare
  - Added /trackings/exports method
  - Added auto-retry mechanism if invalid JSON response retrieved
  
* 2015-11-11 Pump version to 4.2.0
  - Removed v3 code, support ENV variable AFTERSHIP_API_ENDPOINT for testing

* 2014-10-31 Pump version to 4.1.0
  - Replaced HTTPI with HTTPClient

* 2014-10-28 Pump version to 4.0.0, support latest v4 api
  - Adding deprecation messages
  - Adding new api endpoints
  - Make all changes regarding new API version

* 2014-04-11 Pump version to 3.0.1, support latest v3 api
  - Removed the debug message

* 2014-04-11 Pump version to 3.0.0, support latest v3 api
  - Change license to MIT


## Installation

1. Add the following line to your application's Gemfile

```ruby
gem "aftership", "~> 4.5.2"
```

2. Run bundler

```shell
bundle install
```

## Configuration

1. Before you begin

You'll need to have a AfterShip account: http://www.aftership.com


2. Setup the API Key

You can retrieve your api key at: https://admin.aftership.com/settings/api-keys

## Usage

1. Setup
    
Before using API, please include the gem in your script.

```ruby
require 'rubygems'
require 'aftership'
```

You should set you API key before making any request to AfterShip.

```ruby
AfterShip.api_key = 'YOUR_API_KEY' # Replace "YOUR_API_KEY" to your AfterShip api key.
```


2. Coding

```ruby
require('aftership')
AfterShip.api_key = 'YOUR_API_KEY'

AfterShip::V4::Courier.get
AfterShip::V4::Courier.get_all
AfterShip::V4::Courier.detect({:tracking_number => 'EJ276142450JP'})

AfterShip::V4::Tracking.create('1ZA6F598D992381375', {:emails => ['a@abcd.com', 'asdfasdfs@gmail.com']})
AfterShip::V4::Tracking.get('ups', '1ZA6F598D992381375')
AfterShip::V4::Tracking.get_all
AfterShip::V4::Tracking.update('ups', '1ZA6F598D992381375', {:title => 'Testing'})
AfterShip::V4::Tracking.retrack('ups', '1ZA6F598D992381375')
AfterShip::V4::Tracking.delete('ups', '1ZA6F598D992381375')

AfterShip::V4::LastCheckpoint.get('ups', '1ZA6F598D992381375')
```

## The License (MIT)

Released under the MIT license. See the LICENSE file for the complete wording.


## Contributor

- Ryan Zou [twitter:renyuanz](https://twitter.com/ry_zou)
- Alex Topalov <me@alextopalov.com>

