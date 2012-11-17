# encoding: UTF-8
class SongResult
  attr_accessor :id, :title, :link

  def initialize(id, title, link)
    @id = id
    @title = title
    @link = link
  end
  
  def to_json(*a)
    { 'id' => id, 'title' => title, 'link' => link }.to_json(*a)
  end

end