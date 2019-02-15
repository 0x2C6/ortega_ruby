require 'net/http'
require 'ortega/file'
require 'active_support/core_ext/hash/indifferent_access'

module Ortega
  module HTTP
    def download(url, options = {}, &block)
      options = options.with_indifferent_access
      url = HTTP.url_helper(url)
      options[:name] = url.path if options[:name].nil?
      path = Ortega::File.get_path(options)
    
      ::File.open(path, "wb+") do |file|
        file.write Net::HTTP.get(url)
      end
    end

    def test(uri)
      uri = URI(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == 'https'
      a = 0
      http.start do |http|
        http.request Net::HTTP::Get.new uri do |response|
          puts response.read_header['Content-Length']
          # response.read_body do |chunk|
          #   a += chunk.size
          # end
        end
      end
      puts a
    end
  
    class << self
      def url_helper(url)
        url.insert(0, 'http://') unless url.match(/http/) 
        return URI url
      end
    end
  end
end

