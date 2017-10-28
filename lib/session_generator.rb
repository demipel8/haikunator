class SessionGenerator
  def initialize(artists, discos, token=nil, delimiter=nil)
    @artists = artists
    @discos = discos
    @token = token
    @delimiter = delimiter || " "
  end

  def build
    [select_artist, select_disco, @token]
      .compact
      .join(@delimiter)
  end

  private

  def select_artist
    @artists.sample
  end

  def select_disco
    @discos.sample
  end

  def random_seed
    rand(4096)
  end
end