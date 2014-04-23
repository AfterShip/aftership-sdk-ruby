require 'httpi'
require 'json'

HTTPI.log = false

module AfterShip
  module V3
    class Base

      def self.call(http_verb_method, end_point, params = {}, body = {})
        url = "#{AfterShip::URL}/v3/#{end_point.to_s}"
        unless params.empty?
          url += '?' + Rack::Utils.build_query(params)
        end

        unless body.empty?
          body.each do |k, v|
            HTTPI.logger.warn("the #{k} field  should be an array") if %w(emails smses).include?(k.to_s) && !v.is_a?(Array)
          end
        end

        request = HTTPI::Request.new(url)
        request.headers = {"aftership-api-key" => AfterShip.api_key}
        request.body = body.to_json

        response = HTTPI.send(http_verb_method.to_sym, request)

        # different
        if response.nil?
          raise(AfterShipError.new("response is nil"))
        else
          return JSON.parse(response.raw_body)
        end
      end

      class AfterShipError < StandardError;

      end
    end
  end
end