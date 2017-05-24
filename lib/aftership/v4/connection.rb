module AfterShip
  class Connection
    attr_reader :retries

    # Maximum number of retries
    MAX_REQUESTS = 5
    def initialize
      @retries = 0
    end

    def get(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .get(url(path), options)
      end
    end

    def post(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .post(url(path), options)
      end
    end

    def put(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .put(url(path), options)
      end
    end

    def delete(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .delete(url(path), options)
      end
    end

    private

    def handle_connection
      raise ArgumentError unless block_given?

      with_error_handling do
        parse_response(yield)
      end
    end

    def with_error_handling
      raise ArgumentError unless block_given?

      begin
        yield
      # Rescue from any  connection issues
      rescue HTTP::ConnectionError
        raise if requests > MAX_REQUESTS
        @requests += 1
        sleep(5)
        retry
      end
    end

    def parse_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def url(path)
      [AfterShip::URL, 'v4', path].join('/')
    end

    def headers
      @headers ||= {
        'aftership-api-key' => AfterShip.api_key,
        'Content-Type' => 'application/json'
      }
    end
  end
end
