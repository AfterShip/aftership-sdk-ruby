require File.dirname(__FILE__) + '/base'

module AfterShip
  module V3
    class Courier < AfterShip::V3::Base

      def self.get
        call(:get, "couriers")
      end

      def self.detect(tracking_number = '')
        if tracking_number.empty?
          raise ArgumentError.new("tracking_number is required.")
        else
          call(:get, "couriers/detect/#{tracking_number}")
        end
      end

    end
  end
end