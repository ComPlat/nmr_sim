require 'net/http'

module Simulation
  class Nmrdb
    attr_reader :molfile
    def initialize(args)
      @molfile = args.fetch(:molfile)
    end

    def fetch
      {response_1h: response_1h, response_13c: response_13c}
    end

    private

    def uri_1h
      URI('https://script.epfl.ch/script/Service/20160510/vDpGux3hsy')
    end

    def uri_13c
      URI('https://script.epfl.ch/script/Service/20140827/6klsXZb3NS')
    end

    def response(uri)
      response = Net::HTTP.post_form(uri, "molfile" => molfile)
      response.is_a?(Net::HTTPSuccess) ? response.body : nil
    end

    def response_1h
      @response_1h = valid_1h(response(uri_1h))
    end

    def response_13c
      @response_13c = valid_13c(response(uri_13c))
    end

    def valid_1h(response)
      response && JSON.parse(response)["spinus"] ? response : nil
    end

    def valid_13c(response)
      response && JSON.parse(response)["resultLog"] == "finished OK" ? response : nil
    end
  end
end
