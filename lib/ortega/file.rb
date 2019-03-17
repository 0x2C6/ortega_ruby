require 'corol'

module Ortega
  class File
    attr_reader :name, :destination, :extension

    def initialize(args = {})
      @name = args[:name]
      @destination = args[:path]
      @extension = args[:extension]
    end

    def write(response, options)
      ::File.open(@destination, 'wb') do |io|
        content_length = response.header['Content-Length']
        chunk_size = 0
        # if response.is_a?(Net::HTTPRedirection)
        #   puts 'redirect'
        #   exit
        # end
        puts "Downloading #{@name}".green unless options[:bar] == false
        response.read_body do |chunk|
          io.write chunk
          chunk_size += chunk.size
          percent = ((chunk_size * 100) / content_length.to_i)
          if percent <= 20
            hashtag = '#'.red
          elsif percent > 20 && percent <= 80
            hashtag = '#'.yellow
          elsif percent > 80
            hashtag = '#'.green
          end
          unless options[:bar] == false
            $stdout.print "#{hashtag * percent} #{percent.to_s.rjust(103 - percent, ' ')} %\r"
            $stdout.flush
          end
        end
      end
    end

    def self.get_path(options)
      options = options.with_indifferent_access
      file = new(options)

      file.instance_eval do
        @extension[0] == '.' ? '' : @extension.insert(0, '.')
        @name = @name.split('/').last + @extension
        @destination = ::File.join(
          "#{file.destination ? ::File.expand_path(file.destination) :  '.'}",
          file.name)
      end

      return file
    end
  end
end
