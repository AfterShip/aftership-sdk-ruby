require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aftership'))

# config
AfterShip.api_key = "YOUR_API_KEY"


# call
puts slug_name_pairs = AfterShip::V2::Courier.get_couriers
puts AfterShip::V2::Tracking.create("218501627271", "toll-global-express")
puts AfterShip::V2::Tracking.get("218501627271", "toll-global-express")