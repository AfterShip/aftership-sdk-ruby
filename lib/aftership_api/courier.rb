require File.dirname(__FILE__) + '/base'

module AfterShipAPI
  class Courier < AfterShipAPI::Base
    def self.get_couriers
      call(:get, "couriers")
    end
  end
end