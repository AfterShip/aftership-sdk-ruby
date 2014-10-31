require 'httpi'
require 'json'

HTTPI.log = false


module AfterShip
  module V4
    class Base
      class AfterShipError < StandardError; end
      attr_reader :http_verb_method, :end_point, :params, :body

      def initialize(http_verb_method, end_point, params = {}, body = {})
        @body = body
        @params = params
        @end_point = end_point
        @http_verb_method = http_verb_method
      end

      def call
        validate
        if response = HTTPI.send(http_verb_method.to_sym, request)
          return JSON.parse(response.raw_body)
        else
          raise(AfterShipError.new("response is nil"))
        end
      end

      private

      def validate
        body.each do |key, value|
          if %w(emails smses).include?(key.to_s) && !value.is_a?(Array)
            HTTPI.logger.warn("the #{key} field  should be an array")
          end
        end
      end

      def url
        api_url = "#{AfterShip::URL}/v4/#{end_point.to_s}"
        if !params.empty?
          api_url += '?' + Rack::Utils.build_query(params)
        end
        api_url
      end

      def request
        req = HTTPI::Request.new(url)
        req.auth.ssl.ssl_version = :TLSv1
        req.headers = {"aftership-api-key" => AfterShip.api_key, 'Content-Type' => 'application/json'}
        req.body = body.to_json
        req
      end
    end
  end
end
