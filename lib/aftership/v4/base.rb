require 'faraday'
require 'faraday_middleware'

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
          faraday.request :url_encoded
          faraday.response :json, content_type: 'application/json'
          faraday.adapter :net_http
        end
      end

      def call
        headers = { 'aftership-api-key' => AfterShip.api_key }

        cf_ray = ''
        output = nil

        loop do
          response = @client.run_request(http_verb_method, url, @body, headers)

          cf_ray = response.headers['CF-RAY'] if response.headers

          if response.body
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

      private

      def url
        "#{AfterShip::URL}/v4/#{end_point}"
      end
    end
  end
end
