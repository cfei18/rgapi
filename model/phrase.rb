STATES = ["no_annotation", "state-accepted", "state-rough", "state-suspect"]
class Phrase
  attr_accessor :id, :text, :link, :state, :verified

  def initialize(id = 0, text = nil, link = nil, class_str = [])
    @id = id
    @text = text
    @link = link
    if class_str == nil || class_str.empty?
      @state = nil
      @verified = false
    else
      classes = class_str.split

      @state = (classes & STATES)[0]
      @verified = classes.include?("has_verified_annotation")
    end
  end

  def to_json(*a)
    { 'id' => id, 'text' => text, 'link' => link, "state" => state, "verified" => verified }.to_json(*a)
  end

end