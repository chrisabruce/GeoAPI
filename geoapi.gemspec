Gem::Specification.new do |s|
  s.name     = "geoapi"
  s.version  = "0.2.1"
  s.date     = "2009-11-10"
  s.summary  = "A Ruby wrapper for the GeoAPI.com API."
  s.email    = "chrisabruce@gmail.com"
  s.homepage = "http://github.com/chrisabruce/GeoAPI/"
  s.description = "A Ruby wrapper for the GeoAPI.com API. See http://api.geoapi.com for more information about the API."
  s.authors  = ["Chris Bruce"]
  
  s.files    = [
		"README",
		"LICENSE",
		"geoapi.gemspec", 
		"lib/geoapi.rb",
		"lib/geoapi/query.rb",
		"lib/geoapi/entity.rb",
		"lib/geoapi/view.rb",
		"lib/geoapi/version.rb"
	]
  
  s.add_dependency("rest-client",   [">= 0.9"])
  s.add_dependency("json", [">= 1.1.3"])
  
  s.has_rdoc = false
  s.rdoc_options = ["--main", "README.rdoc"]
end