class Connector
  def initialize
    @hydra = Typhoeus::Hydra.new(:max_concurrency => 20)
  end
end