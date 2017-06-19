module AfterShip
  module V4
    class Base
      class AfterShipError < StandardError
      end

      # Performs a HTTP GET request.
      #
      # @param path [String]
      # @param options [Hash]
      # @example
      #   .get('/labels')
      #   .get('/labels', { params: { limit: 5 } })
      def get(path, params = {})
        Connection.new.get(path, params)
      end

      # Performs a HTTP POST request.
      #
      # @param path [String]
      # @param options [Hash]
      # @example
      #   .post('/labels')
      #   .post('/labels', { json: { my: { sample: :data } } })
      def post(path, params = {})
        Connection.new.post(path, params)
      end

      # Performs a HTTP PUT request.
      #
      # @param path [String]
      # @param options [Hash]
      # @example
      #   .put('/trackings/foo/123', { sample: :data })
      def put(path, params = {})
        Connection.new.put(path, params)
      end

      # Performs a HTTP DELETE request
      #
      # @param path [String]
      # @example
      #   .delete(' /trackings/foo/123')
      def delete(path, params = {})
        Connection.new.delete(path, params)
      end

      # Prepare parameters for query
      def parameters
        @parameters ||= {
          query: query,
          body: body.to_json,
          header: headers
        }
      end
    end
  end
end
