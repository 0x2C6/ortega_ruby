class Ortega::File < File
  attr_reader :name, :destination
  def initialize(args = {})
    @name = args[:name]
    @destination = args[:path]
    @extentsion = args[:extentsion]
  end

  def self.get_path(options)
    file = new(options)
    file.instance_eval do 
      @name.delete_suffix('/')
    end
    return join(
      "#{file.destination ? File.expand_path(file.destination) :  '.'}",
      file.name
    ) 
  end

  
end