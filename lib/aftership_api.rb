$:.unshift File.dirname(__FILE__)

require "aftership_api/courier"
require "aftership_api/tracking"

module AfterShipAPI
  class << self;
    attr_accessor :api_key
  end

  API_VERSION = "2"
  API_URL = "https://api.aftership.com"
  API_FORMAT = "json"
end