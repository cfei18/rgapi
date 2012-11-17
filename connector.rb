# encoding: UTF-8
class Connector
  def initialize
    @hydra = Typhoeus::Hydra.new(:max_concurrency => 20)
  end

  def get_html(url, headers = {})
    request = Typhoeus::Request.new(url,
      :method => :get,
      :headers => headers)
    @hydra.queue(request)
    @hydra.run

    puts "Getting URL: #{url}"

    if request.response.code != 200
      raise Error, "Failed to get URL"
    end

    request.response.body
  end
  
end