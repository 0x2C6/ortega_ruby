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
      
      # File.open(path, "wb+") do |file|
      #   file.write Net::HTTP.get(uri)
      # end
    end

    def test
      Ortega::File.salam
    end
  
    class << self
    

      def url_helper(url)
        url.insert(0, 'http://') unless url.match(/http/) 
        return URI url
      end
    end
  end
end

