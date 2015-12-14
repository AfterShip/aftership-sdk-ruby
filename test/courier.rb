require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aftership'))
require './config.rb'

# config
AfterShip.api_key = TestConfig.api_key

# puts couriers = AfterShip::V4::Courier.get

puts detect = AfterShip::V4::Courier.detect({:tracking_number => 'RA123456789HK'})