%w{rubygems rest_client}.each { |x| require x }
 
if defined?(ActiveSupport::JSON)
  JSON = ActiveSupport::JSON
  module JSON
    def self.parse(json)
      decode(json)
    end
  end
else
  require 'json'
end
 
require 'geoapi/version'
require 'geoapi/entity'
require 'geoapi/view'
require 'geoapi/query'
 
module GeoAPI
  API_VERSION = "v1"
  API_URL     = "http://api.geoapi.com/#{API_VERSION}/"
    
  class << self
    attr_accessor :apikey
  end
 
  class BadRequest           < StandardError; end
  class NotFound             < StandardError; end
  class NotAcceptable        < StandardError; end
end