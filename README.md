aftership-ruby
==============

Ruby Gem for AfterShip API.

This extension helps developers to integrate with AfterShip easily.

About AfterShip
==============

AfterShip provides an automated way for online merchants to track packages and send their customers delivery status notifications. Customers no longer need to deal with tracking numbers and track packages on their own. With AfterShip, online merchants extend their customer service after the point of purchase by keeping their customers actively informed, while saving time and money by reducing customers’ questions about the status of their purchase delivery. 

Installation
============

###1. Add the following line to your application's Gemfile

     gem "aftership", "~> 1.0.3"

###2. Run bundler

      bundle install


Configuration
=============
###1. Before you begin
  
You'll need to have a AfterShip account [http://www.aftership.com](http://www.aftership.com).

	
###2. Setup the API Key
  
You can retrieve your api key at [https://www.aftership.com/connect/api](https://www.aftership.com/connect/api).  


Usage
=====
###1. Setup
Before using API, please include the gem in your script

	require 'rubygems'
	require 'aftership'
You should set you API key before making any request to AfterShip.

	AfterShip.api_key = "YOUR_API_KEY"
Replace "YOUR_API_KEY" to your AfterShip api key.

###2. Get Courier list
You can retrive the list of couriers we support by calling:

	AfterShip::V2::Courier.get_couriers
	
Result:

	{
		"success"=>true, 
		"couriers"=>[
			{"slug"=>"korea-post", "name"=>"Korea Post"}, 
			{"slug"=>"israel-post", "name"=>"Israel Post"},
			{"slug"=>"spain-correos-es", "name"=>"Correos de España"},
			{"slug"=>"china-ems", "name"=>"China EMS"}, 
			{"slug"=>"sf-express", "name"=>"S.F. Express"}, 
			{"slug"=>"australia-post", "name"=>"Australia Post"}, 
			{"slug"=>"portugal-ctt", "name"=>"Portugal CTT"}, 
			{"slug"=>"dhl-global-mail", "name"=>"DHL Global Mail"}, 
			{"slug"=>"russian-post", "name"=>"Russian Post"}, 
			{"slug"=>"malaysia-post", "name"=>"Malaysia Post"}, 
			{"slug"=>"thailand-post", "name"=>"Thailand Thai Post"}, 
			{"slug"=>"oca-ar", "name"=>"Argentina OCA E-Pak"}, 
			{"slug"=>"parcel-force", "name"=>"Parcel Force"}, 
			{"slug"=>"royal-mail", "name"=>"Royal Mail"}, 
			{"slug"=>"aramex", "name"=>"Aramex"}, 
			{"slug"=>"star-track", "name"=>"Star Track Australia"}, 
			{"slug"=>"taqbin-sg", "name"=>"TAQBIN Singapore"}, 
			{"slug"=>"spanish-seur", "name"=>"Spanish Seur"}, 
			{"slug"=>"portugal-seur", "name"=>"Portugal Seur"}, 
			{"slug"=>"international-seur", "name"=>"International Seur"}, 
			{"slug"=>"dhl-nl", "name"=>"DHL Netherlands"}, 
			{"slug"=>"taqbin-hk", "name"=>"TAQBIN Hong Kong"}, 
			{"slug"=>"brazil-correios", "name"=>"Brazil Correios"}, 
			{"slug"=>"canada-post", "name"=>"Canada Post"}, 
			{"slug"=>"dhl-germany", "name"=>"DHL Germany"}, 
			{"slug"=>"hong-kong-post", "name"=>"Hong Kong Post"}, 
			{"slug"=>"india-post", "name"=>"India Post"}, 
			{"slug"=>"ontrac", "name"=>"OnTrac"}, 
			{"slug"=>"singapore-post", "name"=>"Singapore Post"}, 
			{"slug"=>"singapore-speedpost", "name"=>"Singapore Speedpost"}, 
			{"slug"=>"swiss-post", "name"=>"Swiss Post"}, 
			{"slug"=>"tnt", "name"=>"TNT"}, 
			{"slug"=>"usps", "name"=>"USPS"}, 
			{"slug"=>"fedex-uk", "name"=>"Fedex UK"}, 
			{"slug"=>"flash-courier", "name"=>"Flash Courier"}, 
			{"slug"=>"dpd", "name"=>"DPD"}, 
			{"slug"=>"purolator", "name"=>"Purolator"}, 
			{"slug"=>"la-poste-colissimo", "name"=>"La Poste Colissimo"}, 
			{"slug"=>"saudi-post", "name"=>"Saudi Post"}, 
			{"slug"=>"dhl-poland", "name"=>"DHL Poland"}, 
			{"slug"=>"siodemka", "name"=>"Siodemka"}, 
			{"slug"=>"opek", "name"=>"OPEK"}, 
			{"slug"=>"danmark-post", "name"=>"Danmark Post"}, 
			{"slug"=>"chronopost-portugal", "name"=>"Chronopost Portugal"}, 
			{"slug"=>"mexico-senda-express", "name"=>"Mexico Senda Express"}, 
			{"slug"=>"mexico-redpack", "name"=>"Mexico Redpack"}, 
			{"slug"=>"mexico-multipack", "name"=>"Mexico Multipack"}, 
			{"slug"=>"toll-global-express", "name"=>"Toll Global Express"}, 
			{"slug"=>"dhl", "name"=>"DHL"}, 
			{"slug"=>"gls", "name"=>"GLS"}, 
			{"slug"=>"ups", "name"=>"UPS"}, 
			{"slug"=>"fedex", "name"=>"Fedex"}
		]
	}
	
###3. Add tracking to AfterShip
You can add tracking number to AfterShip by calling

	AfterShip::V2::Tracking.create("218501627271", "toll-global-express")

The first paramter is the tracking number and the second parameter is the courier slug.
Optionally, you can pass extra paramaters to our API, for example, customer name:
	
	AfterShip::V2::Tracking.create("218501627271", "toll-global-express", customer_name: "John Doe")
	
For extra parameters list, please consult our API specification [https://github.com/AfterShip/api/wiki/Create-Single-Tracking-Shipment](https://github.com/AfterShip/api/wiki/Create-Single-Tracking-Shipment)

###4.Get tracking result
You can restrive your tracking result by calling 

	=> AfterShip::V2::Tracking.get("218501627271", "toll-global-express")

It will return the tracking detail:
	
	{
		"created_at"=>"2013-02-03T14:43:07Z",
		"updated_at"=>"2013-02-03T14:43:18Z", 
		"destination_address"=>nil, 
		"destination_city"=>nil, 
		"destination_country_iso3"=>nil, 
		"destination_country_name"=>"Australia Other - AUSTRALIA", 
		"destination_state"=>nil, 
		"destination_zip"=>nil, 
		"origin_address"=>nil, 
		"origin_city"=>nil, 
		"origin_country_iso3"=>nil, 
		"origin_country_name"=>"HONG KONG", 
		"origin_state"=>nil, "origin_zip"=>nil, 
		"shipment_package_count"=>1, 
		"shipment_type"=>"Export Non Documents - Retail", 
		"shipment_weight"=>nil, 
		"signed_by"=>nil, 
		"tracking_number"=>"218501627271", 
		"order_id"=>nil, 
		"order_id_path"=>nil, 
		"customer_name"=>nil, 
		"title"=>"218501627271",
		"source"=>nil, 
		"smses"=>[],
		"emails"=>[], 
		"custom_fields"=>{}, 
		"shipment_pickup_date"=>"2013-01-16 17:05", 
		"shipment_delivery_date"=>"2013-01-21 01:01", 
		"shipment_scheduled_delivery_date"=>nil, 
		"checkpoints"=>[
			{
				"country_name"=>"HONG KONG",
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, 
				"zip"=>nil, 
				"message"=>"Collection", 
				"coordinates"=>[], 
				"tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-16 17:05"
			}, {
				"country_name"=>"HONG KONG", 
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, "zip"=>nil, 
				"message"=>"Arrived Hub", 
				"coordinates"=>[], 
				"tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-16 18:06"
			}, {
				"country_name"=>"HONG KONG", 
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, 
				"zip"=>nil, 
				"message"=>"Arrived Hub", 
				"coordinates"=>[], 
				"tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-16 18:06"
			}, {
				"country_name"=>"HONG KONG", 
				"country_iso3"=>nil, 
				"state"=>nil, "city"=>nil, 
				"zip"=>nil, 
				"message"=>"Sorted to Destination", 
				"coordinates"=>[], 
				"tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-16 18:06"
			}, {
				"country_name"=>"HONG KONG", 
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, 
				"zip"=>nil, 
				"message"=>"In Transit to Destination", 
				"coordinates"=>[], 
				"tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-16 23:11"
			}, {
				"country_name"=>"Port Melbourne (MEL) - AUSTRALIA", 
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, 
				"zip"=>nil, 
				"message"=>"Arrived Hub", 
				"coordinates"=>[], 
				"tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-18 06:06"
			}, {
				"country_name"=>"Port Melbourne (MEL) - AUSTRALIA", 
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, 
				"zip"=>nil, 
				"message"=>"Delivered", 
				"coordinates"=>[], 
				"tag"=>"Delivered", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-21 01:01"
			}, {
				"country_name"=>"Geelong - AUSTRALIA", 
				"country_iso3"=>nil, 
				"state"=>nil, 
				"city"=>nil, 
				"zip"=>nil, 
				"message"=>"In Transit to Destination", 
				"coordinates"=>[], "tag"=>"InTransit", 
				"processing_port"=>"origin", 
				"created_at"=>"2013-02-03T14:43:18Z", 
				"checkpoint_time"=>"2013-01-21 08:08"
			}
		]
	}
		
---------------------------------------

Copyright (c) 2013 AfterShip Ltd. , released under the New BSD License
