$:.unshift File.dirname(__FILE__)

require "aftership/courier"
require "aftership/tracking"

module AfterShip
  class << self;
    attr_accessor :api_key
  end

  VERSION = "2"
  URL = "https://api.aftership.com"
  FORMAT = "json"
end