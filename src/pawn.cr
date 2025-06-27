require "digest/sha1"
require "http/client"

require "./pawn/version"
require "./pawn/**"

struct Pawn
  def initialize(*, padding = false)
    @http_client = HTTP::Client.new(self.class.uri)
    set_headers(padding)
  end

  def count(password : String) : Int32
    digest = Digest::SHA1.hexdigest(password)
    first, last = digest[0, 5], digest[5..]

    @http_client.get("/range/#{first}") do |response|
      raise_if_failed(response)

      response.body_io
        .each_line
        .find(&.downcase.starts_with? last)
        .try(&.split(':')[1]?.try &.to_i?) || 0
    end
  end

  def pwned?(password : String) : Bool
    count(password) > 0
  end

  def self.count(password, *, padding = false)
    new(padding: padding).count(password)
  end

  def self.pwned?(password, *, padding = false)
    new(padding: padding).pwned?(password)
  end

  def self.uri : URI
    URI.parse("https://api.pwnedpasswords.com/")
  end

  private def set_headers(padding)
    @http_client.before_request do |request|
      set_user_agent(request.headers)
      set_padding(request.headers, padding)
    end
  end

  private def set_user_agent(headers)
    headers["User-Agent"] = "Pawn/#{Pawn::VERSION} \
      (+https://github.com/GrottoPress/pawn)"
  end

  private def set_padding(headers, padding)
    headers["Add-Padding"] = "true" if padding
  end

  private def raise_if_failed(response)
    return if response.status.success?
    raise Error.new(response, "Request failed for #{self.class.uri}")
  end
end
