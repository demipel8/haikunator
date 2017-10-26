require_relative "ruta_destroy/version"
require "securerandom"

module RutaDestroy
  def self.sesion(token_range = 9999, delimiter = "-")
    SessionGenerator.new.build(token_range, delimiter, self.artists, self.discos)
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

  class SessionGenerator
    def build(token_range, delimiter, artists, discos)
      sections = [
        artists[random_seed % artists.length],
        discos[random_seed % discos.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    private

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end
  end
end
