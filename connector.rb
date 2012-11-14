class Connector
  def initialize
    @hydra = Typhoeus::Hydra.new(:max_concurrency => 20)
  end

  def get_html url
    request = Typhoeus::Request.new(url, :method => :get)
    @hydra.queue(request)
    @hydra.run

    if request.response.code != 200
      raise Error, "Failed to get URL"
    end

    request.response.body
  end
  
end