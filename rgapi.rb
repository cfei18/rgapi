class RGAPI
  def initialize
    @connection = Connector.new
  end

  def do_something
    @connection.get_html 'http://rapgenius.com'
  end
end
