require_relative "../spec_helper"
require_relative "../../lib/session_generator"

describe 'SessionGenerator' do
  let(:artists) { %w(PacoPil) }
  let(:discos) { %w(Barraca) }

  it "generates a session given a delimiter, a list of artists, a list of discos and a token" do
    name = SessionGenerator.new(%w(PacoPil), %w(Barraca), '5102', "-").build

    expect(name).to match("PacoPil-Barraca-5102")
  end

  it "drops the token if token is nil" do
    name = SessionGenerator.new(%w(PacoPil), %w(Barraca), nil, "-").build

    expect(name).to eq("PacoPil-Barraca")
  end

  it "permits optional configuration of the delimiter" do
    name = SessionGenerator.new(%w(PacoPil), %w(Barraca), '4301', ".").build

    expect(name).to match('PacoPil.Barraca.4301')
  end

  it "drops the token and delimiter if token range nil and delimiter is nil" do
    name = SessionGenerator.new(%w(PacoPil), %w(Barraca)).build

    expect(name).to eq("PacoPil Barraca")
  end
end
