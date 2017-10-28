class SessionGenerator
  def initialize(artist, disco, token=nil, delimiter=nil)
    @artist = artist
    @disco = disco
    @token = token
    @delimiter = delimiter || " "
  end

  def build
    [@artist, @disco, @token]
      .compact
      .join(@delimiter)
  end
end