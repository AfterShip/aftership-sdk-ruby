require File.dirname(__FILE__) + '/base'

module AfterShip
  module V4
    class LastCheckpoint < AfterShip::V4::Base
      def self.get(slug = '', tracking_number = '')
        if slug.nil? || slug.empty? || tracking_number.nil? || tracking_number.empty?
          raise ArgumentError, 'slug and tracking_number are required.'
        else
          new(:get, "last_checkpoint/#{slug}/#{tracking_number}").call
        end
      end
    end
  end
end
