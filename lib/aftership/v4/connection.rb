module AfterShip
  class Connection
    attr_reader :retries

    # Maximum number of retries
    MAX_REQUESTS = 5
    def initialize
      @retries = 0
    end

    # Performs a HTTP GET request.
    #
    # @param path [String]
    # @param options [Hash]
    # @example
    #   .get('/labels')
    #   .get('/labels', { params: { limit: 5 } })
    def get(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .get(url(path), options)
      end
    end

    # Performs a HTTP POST request.
    #
    # @param path [String]
    # @param options [Hash]
    # @example
    #   .post('/labels')
    #   .post('/labels', { json: { my: { sample: :data } } })
    def post(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .post(url(path), options)
      end
    end

    # Performs a HTTP PUT request.
    #
    # @param path [String]
    # @param options [Hash]
    # @example
    #   .put('/trackings/foo/123', { sample: :data })
    def put(path, options)
      handle_connection do
        HTTP
          .headers(headers)
          .put(url(path), options)
      end
    end

    # Performs a HTTP DELETE request
    #
    # @param path [String]
    # @example
    #   .delete(' /trackings/foo/123')
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
