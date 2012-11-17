class Line

  attr_accessor :phrases

  def initialize(phrases = [])
    @phrases = phrases
  end

  def to_json(*a)
    { 'phrases' => phrases }.to_json(*a)
  end
end
