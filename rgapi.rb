# encoding: UTF-8
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

    list_items = html_doc.css('.popular li')

    output = []
    list_items.each do |list_item|
      
      link = list_item.css("a")[0]
      link.xpath('//span').remove
      title = link.text
      title.strip!

      song = SongResult.new(
        list_item['data-id'],
        title,
        link['href'])
      output << song
    end
    
    output.to_json
  end

  def fetch_lyric(lyric_link)
    html_source = @conn.get_html 'http://rapgenius.com/' << lyric_link
    html_doc = Nokogiri::HTML(html_source)

    lyrics = html_doc.css('.lyrics')

    song = SongLyric.new
    line = Line.new
    lyrics.children.each do |child|
      if child.to_s != "<br>"
        phrase = Phrase.new(
          child['data-id'],
          child.inner_text.lstrip.gsub(/\n/,"\\n"),
          child['href'],
          child['class'])

        if !phrase.text.empty?
          line.phrases << phrase
        end
      else
        song.lines << line
        line = Line.new
      end
    end

    #Add the last line
    if !line.phrases.empty?
      song.lines << line
    end

    song.to_json
  end

  def quick_search(query)
    url = "http://rapgenius.com/search/quick?"
    url << "q=#{query}"
    url << "&limit=20"
    url << "&timestamp=#{Time.now.to_i}"

    headers = {"accept" => "application/x-javascript, text/javascript, text/html, application/xml, text/xml, */*"}
    response = @conn.get_html(url, headers).force_encoding('UTF-8')

    lines = response.split("\n")
    puts lines
    songs = lines.map { |item|
      arr = item.split("|")
      SongResult.new(arr[2],arr[0].strip,arr[1].strip)
    }

    songs.to_json
  end

  def clean(link)
    link.xpath('//span').remove
    title = link.text
    title.strip!
    puts title
  end

end
