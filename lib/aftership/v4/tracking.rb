module AfterShip
  module V4
    class Tracking < AfterShip::V4::Base
      # POST /trackings
      def self.create(tracking_number, params = {})
        params[:tracking_number] = tracking_number

        new.post('trackings', tracking: params)
      end

      # POST /trackings/:slug/:tracking_number/retrack
      def self.retrack(slug, tracking_number)
        new.post("trackings/#{slug}/#{tracking_number}/retrack")
      end

      # DELETE /trackings/:slug/:tracking_number
      def self.delete(slug, tracking_number)
        new.delete("trackings/#{slug}/#{tracking_number}")
      end

      # DELETE /trackings/:id
      def self.delete_by_id(id)
        new.delete("trackings/#{id}")
      end

      # GET /trackings/:slug/:tracking_number
      def self.get(slug, tracking_number, params = {})
        new.get("trackings/#{slug}/#{tracking_number}", params)
      end

      def self.get_by_id(id, params = {})
        warn 'This method is deprecated, please use #find instead'

        find(id, params)
      end

        # GET /trackings/:id
      def self.find(id, params = {})
        new.get("trackings/#{id}", params)
      end

      def self.get_all(params = {})
        warn 'This method is deprecated, please use #all instead'

        all(params)
      end

      # GET /trackings
      def self.all(params = {})
        new.get('trackings', params)
      end

      # GET /trackings/exports
      def self.export(params = {})
        new.get('trackings/exports', params)
      end

      # PUT /trackings/:slug/:tracking_number
      def self.update(slug, tracking_number, params = {})
        new.put("trackings/#{slug}/#{tracking_number}", tracking: params)
      end
    end
  end
end
