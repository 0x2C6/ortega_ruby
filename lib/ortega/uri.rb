module Ortega
  module URI  
    def url_helper(url)
      url.insert(0, 'http://') unless url.match(/http/) 
      return URI url
    end
  end
end