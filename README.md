## aftership-ruby

Ruby Gem for AfterShip API.

This extension helps developers to integrate with AfterShip easily.

## About AfterShip

AfterShip provides an automated way for online merchants to track packages and send their customers delivery status notifications. Customers no longer need to deal with tracking numbers and track packages on their own. With AfterShip, online merchants extend their customer service after the point of purchase by keeping their customers actively informed, while saving time and money by reducing customers’ questions about the status of their purchase delivery.

### Changes
* 2014-10-28 Pump version to 4.0.0, support latest v4 api
* Adding deprecation messages
* Adding new api endpoints
* Make all changes regarding new API version

* 2014-04-11 Pump version to 3.0.1, support latest v3 api
* Removed the debug message

* 2014-04-11 Pump version to 3.0.0, support latest v3 api
* Change license to MIT


## Installation

1. Add the following line to your application's Gemfile

    ```
    gem "aftership", "~> 3.0"
    ```

2. Run bundler

    ```
    bundle install
    ```


## Configuration

1. Before you begin

    You'll need to have a AfterShip account

    http://www.aftership.com


2. Setup the API Key

    You can retrieve your api key at

    https://www.aftership.com/apps/api


## Usage

1. Setup
    Before using API, please include the gem in your script

	```
	require 'rubygems'
	require 'aftership'
	```

    You should set you API key before making any request to AfterShip.

	```
	AfterShip.api_key = 'YOUR_API_KEY' #Replace "YOUR_API_KEY" to your AfterShip api key.
	```


2. Coding

    ```
    require('aftership')
    AfterShip.api_key = 'YOUR_API_KEY'

    AfterShip::V3::Courier.get
    AfterShip::V3::Courier.detect('1ZA6F598D992381375')

    AfterShip::V3::Tracking.create('1ZA6F598D992381375', {"emails"=>["a@abcd.com", "asdfasdfs@gmail.com"]})
    AfterShip::V3::Tracking.get('ups', '1ZA6F598D992381375')
    AfterShip::V3::Tracking.get_multi()
    AfterShip::V3::Tracking.delete('ups', '1ZA6F598D992381375')
    AfterShip::V3::Tracking.update('ups', '1ZA6F598D992381375', {:title=>"Testing"})
    AfterShip::V3::Tracking.reactivate('ups', '1ZA6F598D992381375')

    AfterShip::V3::LastCheckpoint.get('ups', '1ZA6F598D992381375')

    ```



## The License (MIT)

Released under the MIT license. See the LICENSE file for the complete wording.
