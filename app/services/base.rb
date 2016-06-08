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
      response
    end

    def post(path, args)
      uri = URI.parse("#{endpoint}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      uri.query = URI.encode_www_form(args)
      request = Net::HTTP::Post.new(uri.request_uri)
      response = http.request(request)
      response
    end

    def put(path, args)
      # To do
    end

    def delete(path, args)
      uri = URI.parse("#{endpoint}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      uri.query = URI.encode_www_form(args)
      request = Net::HTTP::Delete.new(uri.request_uri)
      response = http.request(request)
      response
    end
  end
end
