require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aftership_api'))

# config
AfterShipAPI.api_key = "YOUR_API_KEY"


# call
puts slug_name_pairs = AfterShipAPI::Courier.get_couriers
puts AfterShipAPI::V2::Tracking.create("218501627271", "toll-global-express")
puts AfterShipAPI::V2::Tracking.get("218501627271", "toll-global-express")
