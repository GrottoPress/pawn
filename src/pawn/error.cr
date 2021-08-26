class Pawn::Error < Exception
  getter response : HTTP::Client::Response?

  def initialize(@response, *args)
    super(*args)
  end
end
