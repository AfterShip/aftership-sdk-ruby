$:.unshift File.dirname(__FILE__)

require "aftership/courier"
require "aftership/tracking"

module AfterShip
  class << self;
    attr_accessor :api_key_v2
    attr_accessor :api_key_v3
  end

  URL = "https://api.aftership.com"
  FORMAT = "json"
end