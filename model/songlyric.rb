class SongLyric
  attr_accessor :lines

  def initialize(lines = []) {}
    @lines = lines
  end

  def to_json(*a)
    { 'lines' => lines }.to_json(*a)
  end

end
