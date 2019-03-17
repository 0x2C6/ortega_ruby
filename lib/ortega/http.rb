require 'net/http'
require 'ortega/file'
require 'ortega/uri'
require 'active_support/core_ext/hash/indifferent_access'

module Ortega
  module HTTP
    include Ortega::URI

    def download(url, options = {}, &block)
      options = options.with_indifferent_access
      url = url_helper(url)
      options[:name] = url.path if options[:name].nil?
      options[:extension] = ::File.extname(url.path) if options[:extension].nil?
      file = Ortega::File.get_path(options)

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true if url.scheme == 'https'

      http.start do |http|
        http.request Net::HTTP::Get.new url do |response|
          file.write(response)
        end
      end
    end
  end
end
