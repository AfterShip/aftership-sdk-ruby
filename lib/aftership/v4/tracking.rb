module AfterShip
  module V4
    class Tracking < AfterShip::V4::Base
      # Create a tracking
      #
      # @param tracking_number [ID] Tracking number.
      # @see https://www.aftership.com/docs/api/4/trackings/post-trackings API documentation
      # @example
      #   .create('1234567') # Create a tracking
      #   .create('1234567', { title: 'My custom tracking '}) # Creates tracking with custom title
      def self.create(tracking_number, params = {})
        params[:tracking_number] = tracking_number

        new.post('trackings', tracking: params)
      end

      # Retrack an expired tracking
      #
      # @param slug Slug.
      # @param tracking_number [ID] Tracking number
      # @see https://www.aftership.com/docs/api/4/trackings/post-trackings-slug-tracking_number-retrack
      # API documentation
      def self.retrack(slug, tracking_number)
        new.post("trackings/#{slug}/#{tracking_number}/retrack")
      end

      # Delete a tracking
      #
      # @param slug Slug.
      # @param tracking_number [ID] Tracking number
      # @see https://www.aftership.com/docs/api/4/trackings/delete-trackings API documentation
      def self.delete(slug, tracking_number)
        new.delete("trackings/#{slug}/#{tracking_number}")
      end

      # Delete a tracking
      #
      # @param id ID.
      # @see https://www.aftership.com/docs/api/4/trackings/delete-trackings API documentation
      def self.delete_by_id(id)
        new.delete("trackings/#{id}")
      end

      # Get tracking results of a single tracking.
      #
      # @param slug Slug.
      # @param tracking_number [ID] Tracking number
      # @see https://www.aftership.com/docs/api/4/trackings/get-trackings-slug-tracking_number API documentation
      def self.get(slug, tracking_number, params = {})
        new.get("trackings/#{slug}/#{tracking_number}", params)
      end

      # Get tracking results of a single tracking.
      #
      # @deprecated
      # @param id ID.
      # @see https://www.aftership.com/docs/api/4/trackings/get-trackings-slug-tracking_number API documentation
      def self.get_by_id(id, params = {})
        warn 'This method is deprecated, please use #find instead'

        find(id, params)
      end

      # Get tracking results of a single tracking.
      #
      # @param id ID.
      # @see https://www.aftership.com/docs/api/4/trackings/get-trackings-slug-tracking_number API documentation
      def self.find(id, params = {})
        new.get("trackings/#{id}", params)
      end

      # Get tracking results of multiple trackings.
      #
      # @deprecated
      # @see https://www.aftership.com/docs/api/4/trackings/get-trackings API documentation
      def self.get_all(params = {})
        warn 'This method is deprecated, please use #all instead'

        all(params)
      end

      # Get tracking results of multiple trackings.
      #
      # @see https://www.aftership.com/docs/api/4/trackings/get-trackings API documentation
      # @example
      #   .all # Returns all trackings, default
      #   .all(slug: "my-slug") # Limit results by slug
      def self.all(params = {})
        new.get('trackings', params)
      end

      # GET /trackings/exports
      def self.export(params = {})
        new.get('trackings/exports', params)
      end

      # Update a tracking
      #
      # @param slug Slug.
      # @param tracking_number [ID] Tracking number
      # @see https://www.aftership.com/docs/api/4/trackings/put-trackings-slug-tracking_number API documentation
      def self.update(slug, tracking_number, params = {})
        new.put("trackings/#{slug}/#{tracking_number}", tracking: params)
      end

      # Update a tracking
      #
      # @param id ID.
      # @see https://www.aftership.com/docs/api/4/trackings/put-trackings-slug-tracking_number API documentation
      def self.update_by_id(id, params = {})
        new.put("trackings/#{id}", tracking: params)
      end
    end
  end
end
