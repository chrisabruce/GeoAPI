module GeoAPI
  class Base
    class << self
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
        
        # Filter '_' and convert True/False
        options.each_pair do |key, value|
          new_key = key.to_s.gsub(/_/, '-')
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