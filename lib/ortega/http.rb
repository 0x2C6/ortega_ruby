require 'net/http'
require 'active_support/core_ext/hash/indifferent_access'

module Ortega
  module HTTP
    def download(url, options = {}, &block)
      url = url.insert(0, 'http://') unless url.match(/http/) 
      options = options.with_indifferent_access
      uri = URI(url)
      
      path = File.join(
        "#{options[:path] ? File.expand_path(options[:path]) :  '.'}",
        "#{options[:file_name] ? options[:file_name] : uri.path.delete_prefix('/')}"
      )
      
      File.open(path, "wb+") do |file|
        file.write Net::HTTP.get(uri)
      end
    end
  end
end
