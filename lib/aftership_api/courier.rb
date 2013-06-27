require File.dirname(__FILE__) + '/base'

module AfterShipAPI
  module V2
    class Courier < AfterShipAPI::V2::Base
      def self.get_couriers
        call(:get, "couriers")
      end
    end
  end
end