require 'faraday'

module AfterShip
  module V4
    class Base
      class AfterShipError < StandardError
      end
      attr_reader :http_verb_method, :end_point, :query, :body

      MAX_TRIAL = 3
      CALL_SLEEP = 3

      def initialize(http_verb_method, end_point, query = {}, body = {})
        @http_verb_method = http_verb_method
        @end_point = end_point
        @query = query
        @body = body
        @trial = 0

        @client = Faraday.new do |faraday|
          faraday.url_prefix = "#{AfterShip::URL}/v4/"
          faraday.request :url_encoded
          faraday.response :json, content_type: 'application/json'
          faraday.adapter :net_http
        end
      end

      def call
        headers = {
          'aftership-api-key' => AfterShip.api_key,
          content_type: 'application/json',
          user_agent: "aftership-sdk-ruby #{AfterShip::VERSION} (#{RUBY_VERSION})"
        }

        cf_ray = ''
        output = nil
        uri = @client.build_url(end_point, query)
        request_body = body.empty? ? nil : body.to_json

        loop do
          response = @client.run_request(http_verb_method, uri, request_body, headers)
          cf_ray = response.headers['cf-ray'] if response.headers

          if response.body
            # This try catch is actually useless (will improve in next major version.)
            begin
              output = response.body
              @trial = MAX_TRIAL + 1
            rescue StandardError
              @trial += 1

              sleep CALL_SLEEP

              output = {
                meta: {
                  code: 500,
                  message: 'Something went wrong on AfterShip\'s end.',
                  type: 'InternalError'
                },
                data: {
                  body: response.body,
                  cf_ray: cf_ray
                }
              }
            end
          else
            output = {
              meta: {
                code: 500,
                message: 'Something went wrong on AfterShip\'s end.',
                type: 'InternalError'
              },
              data: {
              }
            }
          end

          break if @trial > MAX_TRIAL
        end
        output
      end
    end
  end
end
