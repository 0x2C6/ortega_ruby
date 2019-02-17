module Ortega
  class File
    attr_reader :name, :destination
    
    def initialize(args = {})
      @name = args[:name]
      @destination = args[:path]
      @extension = args[:extension]
    end

    def write(response)
      ::File.open(@destination, 'wb') do |io|
        content_length = response.header['Content-Length']
        chunk_size = 0
        puts "Downloading #{@name}"
        response.read_body do |chunk|
          io.write chunk
          chunk_size += chunk.size
          percent = ((chunk_size * 100) / content_length.to_i)
          $stdout.print "#{'#' * percent} #{percent.to_s.rjust(103 - percent, ' ')} %\r"
          $stdout.flush
        end
      end
    end

    def self.get_path(options)
      options = options.with_indifferent_access
      file = new(options)

      file.instance_eval do 
        @name = @name.split('/').last
        @destination = ::File.join(
          "#{file.destination ? ::File.expand_path(file.destination) :  '.'}",
          file.name)
      end

      return file
    end 
  end
end