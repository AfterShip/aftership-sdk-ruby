require File.dirname(__FILE__) + '/base'

module AfterShip
  module V2
    class Courier < AfterShip::V2::Base
      def self.get_couriers
        call(:get, "couriers")
      end
    end
  end
end