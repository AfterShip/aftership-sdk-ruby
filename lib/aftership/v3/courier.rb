require File.dirname(__FILE__) + '/base'

module AfterShip
	module V3
		class Courier < AfterShip::V3::Base

			def self.get
				new(:get, 'couriers').call
			end

			def self.detect(tracking_number = '')
				if tracking_number.empty?
					raise ArgumentError.new('tracking_number is required.')
				else
					new(:get, "couriers/detect/#{tracking_number}").call
				end
			end

		end
	end
end