class RGAPI
  def initialize
    @conn = Connector.new
  end

  def do_something
    @conn.get_html 'http://rapgenius.com'
  end

  def popular_songs
    html_source = @conn.get_html 'http://rapgenius.com'
    html_doc = Nokogiri::HTML(html_source)

    popular_links = html_doc.css('.popular li a')

    for link in popular_links
      puts link + "<br/>"
    end
  end
end
