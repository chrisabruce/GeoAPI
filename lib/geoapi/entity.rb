module GeoAPI
  class Entity < Base
    attr_reader  :guid, :name, :type, :geom, :url, :latitude, :longitude, :raw_json
    
    alias_method :lat, :latitude 
    alias_method :lon, :longitude
 
    # Class methods
    def self.search(lat, lon, options = {})
      options[:lat] = lat
      options[:lon] = lon
      url = build_url('search', options)
      get_then_parse(url)
    end
    
    def self.get_then_parse(url)
      puts url
      return Entity.new(get(url))
    end
    
    # Instance methods
    def initialize(json)
      @raw_json = json
      self
    end
    
    def to_s
      self.name
    end
    
    def to_json
      self.raw_json
    end
    
  end
end