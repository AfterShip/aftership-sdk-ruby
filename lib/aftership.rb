$:.unshift File.dirname(__FILE__)

require 'aftership/v3/courier'
require 'aftership/v3/tracking'
require 'aftership/v3/last_checkpoint'

require 'aftership/v4/courier'
require 'aftership/v4/tracking'
require 'aftership/v4/last_checkpoint'

module AfterShip
  class << self;
    attr_accessor :api_key
  end

  URL = ENV['AFTERSHIP_API_ENDPOINT'] || 'https://api.aftership.com'
end
