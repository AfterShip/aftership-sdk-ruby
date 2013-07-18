require File.dirname(__FILE__) + '/base'

module AfterShip
  module V2
    class Tracking < AfterShip::V2::Base
      def self.create(tracking_number, courier, opt = {})
        if tracking_number.empty? || courier.empty?
          raise ArgumentError.new("both tracking_number and courier are necessary for this method call")
        end

        query_hash = {:tracking_number => tracking_number, :courier => courier}
        query_hash.merge!(opt)
        call(:post, "trackings", query_hash)
      end

      def self.get(tracking_number, courier)
        if tracking_number.empty? || courier.empty?
          raise ArgumentError.new("both tracking_number and courier are necessary for this method call")
        end

        query_hash = {:tracking_number => tracking_number, :courier => courier}
        call(:get, "trackings", query_hash)
      end
    end
  end

  module V3
    class Tracking < AfterShip::V3::Base
      def self.create(tracking_number, courier, opt = {})
        if tracking_number.empty? || courier.empty?
          raise ArgumentError.new("both tracking_number and courier are necessary for this method call")
        end

        query_hash = {:tracking_number => tracking_number, :courier => courier}
        query_hash.merge!(opt)
        call(:post, "trackings", query_hash)
      end

      def self.get(tracking_number, courier)
        if tracking_number.empty? || courier.empty?
          raise ArgumentError.new("both tracking_number and courier are necessary for this method call")
        end

        call(:get, "trackings/#{courier}/#{tracking_number}")
      end

      def self.get_latest_trackings
        call(:get, "trackings")
      end

      def self.get_last_checkpoint(tracking_number, courier)
        if tracking_number.empty? || courier.empty?
          raise ArgumentError.new("both tracking_number and courier are necessary for this method call")
        end

        call(:get, "last_checkpoint/#{courier}/#{tracking_number}")
      end
    end
  end
end