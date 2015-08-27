require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aftership'))

# config
AfterShip.api_key = "YOUR_API_KEY"


# call
puts AfterShip::V3::Tracking.create('RA123456780HK', {"emails"=>["a@abcd.com", "asdfasdfs@gmail.com"]})

puts AfterShip::V3::Tracking.get('hong-kong-post', 'RA123456780HK')
puts AfterShip::V3::Tracking.get_multi()

puts AfterShip::V3::Tracking.delete('hong-kong-post', 'RA123456780HK')
puts AfterShip::V3::Tracking.update('hong-kong-post', 'RA123456780HK', {:title=>"Testing"})

puts AfterShip::V3::Tracking.reactivate('hong-kong-post', 'RA123456780HK')
puts AfterShip::V3::Tracking.create('1ZA6F598D992381375')


last_checkpoint = AfterShip::V3::LastCheckpoint.get('ups', '1ZA6F598D992381375')
puts last_checkpoint.to_json


puts couriers = AfterShip::V3::Courier.get
puts detect = AfterShip::V3::Courier.detect('RA123456789HK')
