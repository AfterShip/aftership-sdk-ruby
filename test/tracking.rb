require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aftership'))
require './config.rb'

AfterShip.api_key = TestConfig.api_key

puts AfterShip::V4::Tracking.create('RA123456780HK', {:emails => ['a@abcd.com', 'asdfasdfs@gmail.com']})

puts AfterShip::V4::Tracking.get('hong-kong-post', 'RA123456780HK')
puts AfterShip::V4::Tracking.get_all
puts AfterShip::V4::Tracking.export

puts AfterShip::V4::Tracking.update('hong-kong-post', 'RA123456780HK', {:title => 'Testing'})

puts AfterShip::V4::Tracking.delete('hong-kong-post', 'RA123456780HK')


# puts AfterShip::V4::Tracking.reactivate('hong-kong-post', 'RA123456780HK')
# puts AfterShip::V4::Tracking.create('1ZA6F598D992381375')
#
#
# last_checkpoint = AfterShip::V4::LastCheckpoint.get('ups', '1ZA6F598D992381375')
# puts last_checkpoint.to_json
#
#
# puts couriers = AfterShip::V4::Courier.get
# puts detect = AfterShip::V4::Courier.detect('RA123456789HK')