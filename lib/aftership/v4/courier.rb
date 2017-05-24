module AfterShip
  module V4
    class Courier < AfterShip::V4::Base
      # GET /couriers
      # Return a list of couriers activated at your AfterShip account.
      def self.get
        new.get('couriers')
      end

      # GET /couriers/all
      # Return a list of all couriers.
      def self.get_all
        warn 'This method is deprecated, please use #all instead'

        all
      end

      # GET /couriers/all
      # Return a list of all couriers.
      def self.all
        new.get('couriers/all')
      end

      # POST /couriers/detect
      # Return a list of matched couriers based on tracking number format and selected couriers or a list of couriers.
      def self.detect(tracking)
        new.post('couriers/detect', tracking: tracking)
      end
    end
  end
end
