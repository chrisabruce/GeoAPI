module GeoAPI
  class Query
    
    class << self
      # Uses GeoAPI's simple search method
      def simple_search(lat, lon, options = {})
        options[:lat] = lat
        options[:lon] = lon
        url = build_url('search', options)
        get_then_parse(url)
      end
    
      # Uses GeoAPI's MQL query method
      def query(query)
        q = JSON.generate(query)
        url = build_url('q', {:q => URI.escape(q)})
        get_then_parse(url)     
      end
    
    
      def get_then_parse(url)
        JSON.parse(get(url))
      end
    
      def build_url(resource_path, options = {})

        options[:apikey] ||= GeoAPI.apikey
        query_string = build_query_params(options)
      
        "#{GeoAPI::API_URL}#{resource_path}#{query_string}"
      end
    
      def get(url)
        RestClient.get(url)
      rescue RestClient::RequestFailed
        raise BadRequest, "Parameter invalid"
      rescue RestClient::ResourceNotFound
        raise NotFound, "GUID invalid"
      end

      protected
    
      # Take options and build query string
      def build_query_params(options)
        query = {}
      
        #convert True/False
        options.each_pair do |key, value|
          new_key = key.to_s
          new_val = case value
            when TrueClass then 1
            when FalseClass then 0
            else value
          end
          query[new_key] = new_val 
        end
        "?" + query.map{|k,v| "#{k}=#{v}"}.join('&')
      end
    end
  end
end
