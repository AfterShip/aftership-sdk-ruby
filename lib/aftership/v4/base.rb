require 'httpclient'
require 'json'

module AfterShip
  module V4
    class Base
      class AfterShipError < StandardError;
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
        response = nil

        loop do
          response = @client.send(http_verb_method, url, parameters)

          if response.headers
            cf_ray = response.headers['CF-RAY']
          end


          if response.body
            begin
              response = JSON.parse(response.body)
              @trial = MAX_TRIAL + 1
            rescue
              @trial += 1

              sleep CALL_SLEEP

              response = {
                  :meta => {
                      :code => 500,
                      :message => 'Something went wrong on AfterShip\'s end.',
                      :type => 'InternalError'
                  },
                  :data => {
                      :body => response.body,
                      :cf_ray => cf_ray
                  }
              }
            end
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

          break if @trial > MAX_TRIAL
        end

        response
      end

      private

      def url
        "#{AfterShip::URL}/v4/#{end_point.to_s}"
      end

    end
  end
end
