$:.unshift File.dirname(__FILE__)

require "aftership/courier"
require "aftership/tracking"
require "aftership/last_checkpoint"

module AfterShip
  class << self;
    attr_accessor :api_key
  end

  URL = "https://api.aftership.com"
end