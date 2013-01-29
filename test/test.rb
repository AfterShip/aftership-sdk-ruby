require File.expand_path(File.join(File.dirname(__FILE__), 'aftership_api'))

# config
AfterShipAPI.configure(api_key = "dd984223b30e068b0cd624f940f256ede4b76676")

# call
slug_name_pairs = AfterShipAPI::Courier.slug_name_list
AfterShipAPI::Tracking.create("218501627271", "toll-global-express")
AfterShipAPI::Tracking.get("218501627271", "toll-global-express")
