require_relative "ruta_destroy/version"
require_relative "session_generator"
require_relative 'token_generator'

module RutaDestroy
  def self.sesion(token_length = 4, delimiter = "-")
    token = TokenGenerator.new.generate(token_length)
    SessionGenerator.new(self.artists.sample, self.discos.sample, token, delimiter).build
  end

  def self.artists
    %w(
        PacoPil ChimoBayo ToniVidal CarlosSimo JuanitoTorpedo
        FranLenaers DjTete CarlosRufian RafaMarco RafaPastor
        JoséLuiselNano LuisBonías ArturoWitten VicenteMafia
        QuiqueyJuanjoSerrano JesúsBrisa LuisBonias LosGemelos
        Ganimedes ArturoRoger DJJosel KikeJaen DjNino
      )
  end

  def self.discos
    %w(
      Barraca Spook Factory Chocolate Espiral NOD Puzzle ACTV OTK
      Zona Rockola Tuculca Heaven Arena DistritoDiez Arabesco Bananas
      TheFace JardinesDelReal Woody Aquarela Bodegón GiorgioAndEnrico
      ElTemplo CaballitoDeMar Apache Penelope ChivagoRivers KuManises
      Sucre Coliseum
    )
  end
end
