require 'net/http'

module Services
  class Base
    def initialize
    end
  
    private
  
    def endpoint
      self.class::ENDPOINT
    end
  
    def get(path, args)
      uri = URI.parse("#{endpoint}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      uri.query = URI.encode_www_form(args)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      response.body
    rescue
      nil
    end
  end
end
