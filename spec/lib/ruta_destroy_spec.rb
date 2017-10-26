require_relative "../spec_helper"

class RutaDestroyTest
  def self.sesion(token_range = 9999, delimiter = "-")
     RutaDestroy::SessionGenerator.new.build(token_range, delimiter, %w(PacoPil), %w(Barraca))
  end
end

describe RutaDestroy do
  it "generates a name in the format artist-disco-4_number_token like PacoPil-Barraca-5012" do
    name = RutaDestroyTest.sesion

    expect(name).to match(/\APacoPil-Barraca-\d{1,4}\z/)
  end

  it "won't return the same name for subsequent calls" do
    name1 = RutaDestroyTest.sesion
    name2 = RutaDestroyTest.sesion

    expect(name1).not_to eql(name2)
  end

  it "permits optional configuration of the token range" do
    name = RutaDestroyTest.sesion(9)

    expect(name).to match(/\APacoPil-Barraca-\d{1}\z/)
  end

  it "drops the token if token range is 0" do
    name = RutaDestroyTest.sesion(0)

    expect(name).to eq("PacoPil-Barraca")
  end

  it "permits optional configuration of the delimiter" do
    name = RutaDestroyTest.sesion(9999, ".")

    expect(name).to match(/\APacoPil.Barraca.\d{1,4}\z/)
  end

  it "drops the token and delimiter if token range is 0 and delimiter empty space" do
    name = RutaDestroyTest.sesion(0, " ")

    expect(name).to eq("PacoPil Barraca")
  end
end
