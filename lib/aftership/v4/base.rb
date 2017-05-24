module AfterShip
  module V4
    class Base
      class AfterShipError < StandardError
      end

      private

      def get(path, params)
        Connection.new.get(path, params)
      end

      def post(path, params)
        Connection.new.post(path, params)
      end

      def put(path, params)
        Connection.new.put(path, params)
      end

      def delete(path, params)
        Connection.new.delete(path, params)
      end

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
