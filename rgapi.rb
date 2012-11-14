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

    puts "HEY HEY"
    
    popular_links.each do |link|
      puts "#{link}.text"
    end
    popular_links[1].text
  end
end
