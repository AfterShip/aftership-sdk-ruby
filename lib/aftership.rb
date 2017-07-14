require 'http'
require 'json'
require 'dry-configurable'

require 'aftership/version'
require 'aftership/v4/base'
require 'aftership/v4/connection'
require 'aftership/v4/courier'
require 'aftership/v4/tracking'
require 'aftership/v4/last_checkpoint'

module AfterShip
  extend Dry::Configurable

  # @#!attribute [rw] api_key [String] API key taken from the application.
  setting :api_key

  # @#!attribute endpoint [String] Endoint name - specify if you'd like to use custom endpoint
  setting :endpoint

  # Returns the endpoint used in all queries
  #
  # @return [String] endpoint url
  def self.endpoint
    config.endpoint || ENV['AFTERSHIP_API_ENDPOINT'] || 'https://api.aftership.com'
  end

end
