require File.dirname(__FILE__) + '/base'

module AfterShip
  module V4
    class Courier < AfterShip::V4::Base

      #GET /couriers
      #Return a list of couriers activated at your AfterShip account.
      def self.get
        new(:get, 'couriers').call
      end

      #GET /couriers/all
      #Return a list of all couriers.
      def self.get_all
        new(:get, 'couriers/all').call
      end

      #POST /couriers/detect
      #Return a list of matched couriers based on tracking number format and selected couriers or a list of couriers.
      def self.detect(tracking = nil)
        if tracking == nil
          raise ArgumentError.new('tracking object is required.')
        else
          new(:post, 'couriers/detect', {}, { :tracking => tracking }).call
        end
      end
    end
  end
end
