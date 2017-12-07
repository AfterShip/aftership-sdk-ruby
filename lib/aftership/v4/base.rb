require 'httpclient'
require 'json'

module AfterShip
  module V4
    class Base
      class AfterShipError < StandardError;
      end
      attr_reader :http_verb_method, :end_point, :query, :body

      def initialize(http_verb_method, end_point, query = {}, body = {})
        @http_verb_method = http_verb_method
        @end_point = end_point
        @query = query
        @body = body

        @client = HTTPClient.new
      end

      def call
        header = {'aftership-api-key' => AfterShip.api_key, 'Content-Type' => 'application/json'}

        parameters = {
          :query => query,
          :body => body.to_json,
          :header => header
        }

        cf_ray = ''

        response = @client.send(http_verb_method, url, parameters)

        if response.headers
          cf_ray = response.headers['CF-RAY']
        end

        if response.body
          response = JSON.parse(response.body)
        else
          response = {
            :meta => {
              :code => 500,
              :message => 'Something went wrong on AfterShip\'s end.',
              :type => 'InternalError'
            },
            :data => {
            }
          }
        end
      end

      response
    end

    private

    def url
      "#{AfterShip::URL}/v4/#{end_point.to_s}"
    end
  end
end
