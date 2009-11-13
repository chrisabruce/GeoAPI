module GeoAPI
  class Entity < Base
    attr_reader  :guid, :name, :type, :geom, :url, :latitude, :longitude, :views, :userviews, :raw_json
    
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
      response = JSON.parse(get(url))
      results = []
      if response && response['result']
        response['result'].each do |entity|
          results << Entity.new(entity)
        end
      end
      return results
    end
    
    # Instance methods
    def initialize(attrs)
      @raw_json = JSON.generate(attrs)
      @guid = attrs['guid']
      if attrs['meta']
        @name = attrs['meta']['name']
        @views = attrs['meta']['views'] || []
        @userviews = attrs['meta']['userviews'] || []
        @type = attrs['meta']['type'].to_sym
      end
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