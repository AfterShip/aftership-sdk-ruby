module AfterShip
  module V4
    class LastCheckpoint < AfterShip::V4::Base
      def self.get(slug, tracking_number)
        new.get("last_checkpoint/#{slug}/#{tracking_number}")
      end
    end
  end
end
