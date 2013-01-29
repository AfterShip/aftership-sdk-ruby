require 'httpi'
require 'json'

module AfterShipAPI
  class Base #< ActiveResource::Base
    def self.call(http_verb_method, *args)
      url = "#{AfterShipAPI.api_url}/v#{AfterShipAPI.api_version}/#{args.first.to_s}.#{AfterShipAPI.api_format}"
      req_body = {:api_key => AfterShipAPI.api_key}
      req_body.merge!(args.last) if args.last.is_a?(Hash)

      request = HTTPI::Request.new url
      request.body = req_body
      puts "Request:   #{request.inspect}"
      response = HTTPI.send(http_verb_method.to_sym, request)
      puts "Response:  #{response}"

      return JSON.parse(response.raw_body) unless response.nil?
      raise(AfterShipAPIError.new("response is nil"))
    end

    class AfterShipAPIError < StandardError
      def initialize(message)
        super "#{message}"
      end
    end
  end
end