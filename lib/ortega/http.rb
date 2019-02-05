require 'net/http'

module Ortega
  module HTTP
    def download(url, options = {}, &block)
      uri = URI(url)
      File.new(uri.path, "wb") do |file|
        file.write Net::HTTP.get(uri)
      end
    end
  end
end
