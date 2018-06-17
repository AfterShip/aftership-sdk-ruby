require File.dirname(__FILE__) + '/base'

module AfterShip
  module V4
    class LastCheckpoint < AfterShip::V4::Base

      def self.get(slug = '', tracking_number = '', lang='')
        if slug.empty? || tracking_number.empty?
          raise ArgumentError.new('slug and tracking_number are required.')
        else
          new(:get, "last_checkpoint/#{slug}/#{tracking_number}?lang=#{lang}").call
        end
      end

    end
  end
end
