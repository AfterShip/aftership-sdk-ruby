require File.expand_path(File.join(File.dirname(__FILE__), 'aftership_api'))

# config
AfterShipAPI.api_key = "47883a345037f7b3215a99c1c78f889fb46a65df"

# call
puts slug_name_pairs = AfterShipAPI::Courier.get_couriers
puts AfterShipAPI::Tracking.create("218501627271", "toll-global-express")
puts AfterShipAPI::Tracking.get("218501627271", "toll-global-express")
