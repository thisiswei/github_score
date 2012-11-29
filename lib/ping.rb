require 'net/http'
class Ping

  class << self
    def perform 
      url = 'http://gitscore.herokuapp.com'
      Net::HTTP.get_response(URI.parse(url))
    end
  end
end
