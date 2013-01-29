require "aftership_api/courier"
require "aftership_api/tracking"

module AfterShipAPI
  # configuration
  def self.configure(api_key = nil, api_version = "2", api_url = "http://api.aftership.com:3000", api_format = "json")
    return raise(StandardError.new("api_key is necessary!")) if api_key.nil?
    @@api_key = api_key
    @@api_version = api_version
    @@api_url = api_url
    @@api_format = api_format
    return
  end

  # several getters
  def self.api_key; @@api_key; end
  def self.api_version; @@api_version; end
  def self.api_url; @@api_url; end
  def self.api_format; @@api_format; end
end