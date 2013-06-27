require 'httpi'
require 'json'

HTTPI.log = false

module AfterShip
  module V2
    class Base
      def self.call(http_verb_method, *args)
        url = "#{AfterShip::URL}/v#{AfterShip::VERSION}/#{args.first.to_s}.#{AfterShip::FORMAT}"
        req_body = {:api_key => AfterShip.api_key}
        if args.last.is_a?(Hash)
          args.last.each do |k, v|
            HTTPI.logger.warn("this field #{k} should be array") if %w(emails smses).include?(k.to_s) && !v.is_a?(Array)
          end

          opt = {}
          args.last.each {|k, v| v.is_a?(Array) ? opt["#{k}[]"] = v : opt[k] = v}
          req_body.merge!(opt)
        end

        request = HTTPI::Request.new(url)
        request.body = req_body
        response = HTTPI.send(http_verb_method.to_sym, request)

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