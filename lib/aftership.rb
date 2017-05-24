require 'http'
require 'json'

require 'aftership/version'
require 'aftership/v4/base'
require 'aftership/v4/courier'
require 'aftership/v4/tracking'
require 'aftership/v4/last_checkpoint'

module AfterShip
  class << self
    attr_accessor :api_key
  end

  URL = ENV['AFTERSHIP_API_ENDPOINT'] || 'https://api.aftership.com'
end
