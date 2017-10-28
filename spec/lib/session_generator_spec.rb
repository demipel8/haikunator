require_relative "../spec_helper"
require_relative "../../lib/session_generator"

describe 'SessionGenerator' do
  let(:an_artist) { 'PacoPil' }
  let(:a_disco) { 'Barraca' }

  it "generates a session given a delimiter, an artist, a disco and a token" do
    name = SessionGenerator.new(an_artist, a_disco, '5102', "-").build

    expect(name).to match("PacoPil-Barraca-5102")
  end

  it "drops the token if token is nil" do
    name = SessionGenerator.new(an_artist, a_disco, nil, "-").build

    expect(name).to eq("PacoPil-Barraca")
  end

  it "permits optional configuration of the delimiter" do
    name = SessionGenerator.new(an_artist, a_disco, '4301', ".").build

    expect(name).to match('PacoPil.Barraca.4301')
  end

  it "drops the token and delimiter if token range nil and delimiter is nil" do
    name = SessionGenerator.new(an_artist, a_disco).build

    expect(name).to eq("PacoPil Barraca")
  end
end
