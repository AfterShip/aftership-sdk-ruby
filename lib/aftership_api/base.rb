require 'httpi'
require 'json'

module AfterShipAPI
  class Base

    def self.call(http_verb_method, *args)
      url = "#{AfterShipAPI::API_URL}/v#{AfterShipAPI::API_VERSION}/#{args.first.to_s}.#{AfterShipAPI::API_FORMAT}"
      req_body = {api_key: AfterShipAPI.api_key}
      req_body.merge!(args.last) if args.last.is_a?(Hash)

      request = HTTPI::Request.new(url)
      request.body = req_body
      puts "Request:   #{request.inspect}"
      response = HTTPI.send(http_verb_method.to_sym, request)
      puts "Response:  #{response}"

      if response.nil?
        raise(AfterShipAPIError.new("response is nil"))
      else
        return JSON.parse(response.raw_body)
      end
    end

    class AfterShipAPIError < StandardError;
    end
  end
end