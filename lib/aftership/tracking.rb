require File.dirname(__FILE__) + '/base'

# Tracking
# Create trackings, update trackings, and get tracking results.
# see:
#   https://www.aftership.com/docs/api/3.0/tracking
module AfterShip
  module V3
    class Tracking < AfterShip::V3::Base

      # Tracking statuses
      # AfterShip will study the tracking results from the couriers and
      # give each shipment a new delivery status to describe the current situation.
      # Here're the statuses you can find in AfterShip:
      # see:
      #   http://aftership.uservoice.com/knowledgebase/articles/169530-what-does-each-delivery-status-mean
      #   http://aftership.uservoice.com/knowledgebase/articles/169544-why-doesn-t-the-pending-status-get-any-updates

      # Carrier has received request from shipper and is about to pick up the shipment.
      INFO_RECEIVED = 'InfoReceived'

      # The shipment is picked up or received by the courier, meaning the shipment in on the way to the destination.
      # Expected delivery date will be shown if the courier provides this information.
      IN_TRANSIT = 'InTransit'

      # The shipment has arrived your nearest local station,
      # and generally the courier will deliver on the same day or within a few hours.
      OUT_FOR_DELIVERY = 'OutForDelivery'

      # The shipment has been delivered. AfterShip will show you who signed for the shipment if this information is available.
      DELIVERED = 'Delivered'

      # Recipient is not there when delivering the shipment.
      # Courier usually leaves a notice on the door with the next delivery time on it.
      ATTEMPT_FAIL = 'AttemptFail'

      # A delivery exception could be custom hold, undelivered,
      # returned shipment to sender or any exceptions that is happening to the shipments.
      EXCEPTION = 'Exception'

      # The shipment remains with "Pending" status for over 7 days OR
      # The shipment has tracking information but there is no further update from courier for over 30 days since last update
      EXPIRED = 'Expired'

      # The new shipments are just added or shipments have no tracking information at courier website.
      # AfterShip will continue to track the shipments.
      PENDING = 'Pending'

      ACTIVE_STATUSES = [IN_TRANSIT, OUT_FOR_DELIVERY, DELIVERED]

      #POST /trackings
      def self.create(tracking_number, params = {})
        if tracking_number.empty?
          raise ArgumentError.new("The tracking_number is required.")
        else
          query_hash = {:tracking_number => tracking_number}
          query_hash.merge!(params)
          body = {:tracking => query_hash}
          call(:post, "trackings", {}, body)
        end
      end

      #DELETE /trackings/:slug/:tracking_number
      def self.delete(slug, tracking_number)
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new("slug and tracking_number are required.")
        end
        call(:delete, "trackings/#{slug}/#{tracking_number}")
      end

      #GET /trackings
      def self.get_multi(params = {})
        call(:get, "trackings", params)
      end

      #GET /trackings/:slug/:tracking_number
      def self.get(slug, tracking_number)
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new("slug and tracking_number are required.")
        end
        call(:get, "trackings/#{slug}/#{tracking_number}")
      end

      #PUT /trackings/:slug/:tracking_number
      def self.update(slug, tracking_number, params = {})
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new("slug and tracking_number are required.")
        end
        body = {"tracking" => params}
        call(:put, "trackings/#{slug}/#{tracking_number}", {}, body)
      end

      #POST /trackings/:slug/:tracking_number/reactivate
      def self.reactivate(slug, tracking_number)
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new("slug and tracking_number are required.")
        end
        call(:post, "trackings/#{slug}/#{tracking_number}/reactivate")
      end

    end
  end
end