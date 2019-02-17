require 'net/http'
require 'ortega/file'
require 'active_support/core_ext/hash/indifferent_access'

module Ortega
  module HTTP
    def download(url, options = {}, &block)
      options = options.with_indifferent_access
      url = HTTP.url_helper(url)
      options[:name] = url.path if options[:name].nil?
      file = Ortega::File.get_path(options)
    
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true if url.scheme == 'https'
      
      http.start do |http|
        http.request Net::HTTP::Get.new url do |response|
          file.write(response)
        end
      end
    end
    
    class << self
      def url_helper(url)
        url.insert(0, 'http://') unless url.match(/http/) 
        return URI url
      end
    end
  end
end

