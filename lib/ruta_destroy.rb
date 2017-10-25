require_relative "ruta_destroy/version"
require "securerandom"

module RutaDestroy
  class << self
    def sesion(token_range = 9999, delimiter = "-")
      build(token_range, delimiter)
    end

    private

    def build(token_range, delimiter)
      sections = [
        artists[random_seed % artists.length],
        discos[random_seed % discos.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def artists
      %w(
        PacoPil ChimoBayo ToniVidal CarlosSimo JuanitoTorpedo
        FranLenaers DjTete CarlosRufian RafaMarco RafaPastor
        JoséLuiselNano LuisBonías ArturoWitten VicenteMafia
        QuiqueyJuanjoSerrano JesúsBrisa LuisBonias LosGemelos
        Ganimedes ArturoRoger DJJosel KikeJaen DjNino
      )
    end

    def discos
      %w(
        Barraca Spook Factory Chocolate Espiral NOD Puzzle ACTV OTK
        Zona Rockola Tuculca Heaven Arena Distrito10 Arabesco Bananas
        TheFace JardinesDelReal Woody Aquarela Bodegón GiorgioAndEnrico
        ElTemplo CaballitodeMar Apache Penelope ChivagoRivers KuManises
        Sucre Coliseum
      )
    end
  end
end
