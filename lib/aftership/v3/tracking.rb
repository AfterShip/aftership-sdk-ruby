require File.dirname(__FILE__) + '/base'

module AfterShip
  module V3
    class Tracking < AfterShip::V3::Base

      #POST /trackings
      def self.create(tracking_number, params = {})
        if tracking_number.empty?
          raise ArgumentError.new('tracking_number is required.')
        else
          query_hash = { :tracking_number => tracking_number }
          query_hash.merge!(params)
          body = { :tracking => query_hash }
          new(:post, 'trackings', {}, body).call
        end
      end

      #DELETE /trackings/:slug/:tracking_number
      def self.delete(slug, tracking_number)
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        new(:delete, "trackings/#{slug}/#{tracking_number}").call
      end

      #GET /trackings
      def self.get_multi(params = {})
        new(:get, 'trackings', params).call
      end

      #GET /trackings/:slug/:tracking_number
      def self.get(slug, tracking_number, params = {})
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        new(:get, "trackings/#{slug}/#{tracking_number}", params).call
      end

      #PUT /trackings/:slug/:tracking_number
      def self.update(slug, tracking_number, params = {})
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        body = { :tracking => params }
        new(:put, "trackings/#{slug}/#{tracking_number}", {}, body).call
      end

      #POST /trackings/:slug/:tracking_number/reactivate
      def self.reactivate(slug, tracking_number)
        puts 'This method will be deprecate in AfterShipV4'

        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        new(:post, "trackings/#{slug}/#{tracking_number}/reactivate").call
      end

    end
  end
end
