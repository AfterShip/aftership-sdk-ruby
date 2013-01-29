require File.dirname(__FILE__) + '/base'

module AfterShipAPI
  class Courier < AfterShipAPI::Base
    def self.slug_name_list
      call(:get, "couriers")
    end
  end
end