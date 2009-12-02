module GeoAPI
  class Entity
    attr_reader  :guid, :name, :type, :geom, :url, :latitude, :longitude, :views, :userviews, :raw_json
    
    alias_method :lat, :latitude 
    alias_method :lon, :longitude

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