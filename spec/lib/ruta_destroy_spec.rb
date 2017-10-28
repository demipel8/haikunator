require_relative '../spec_helper'

describe 'RutaDestroy' do
  it 'generates a name in the format artist-disco-4_number_token like PacoPil-Barraca-5012' do
    name = RutaDestroy.sesion

    expect(name).to match(/\A\p{L}+-\p{L}+-\d{4}\z/)
  end

  it 'won\'t return the same name for subsequent calls' do
    name1 = RutaDestroy.sesion
    name2 = RutaDestroy.sesion

    expect(name1).not_to eql(name2)
  end

  it 'permits optional configuration of the token range' do
    name = RutaDestroy.sesion(1)

    expect(name).to match(/\A\p{L}+-\p{L}+-\d{1}\z/)
  end

  it 'drops the token if token range is 0' do
    name = RutaDestroy.sesion(0)

    expect(name).to match(/\A\p{L}+-\p{L}+\z/)
  end

  it 'permits optional configuration of the delimiter' do
    name = RutaDestroy.sesion(4, '.')

    expect(name).to match(/\A\p{L}+\.\p{L}+\.\d{1,4}\z/)
  end

  it 'drops the token and delimiter if token range is 0 and delimiter empty space' do
    name = RutaDestroy.sesion(0, ' ')

    expect(name).to match(/\A\p{L}+ \p{L}+\z/)
  end
end
