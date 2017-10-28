require_relative "../spec_helper"
require_relative "../../lib/token_generator"

describe 'TokenGenerator' do
  it 'returns a token with the number of digit requested' do
    token = TokenGenerator.new.generate(2)

    expect(token.length).to be 2
  end

  it 'returns a token which all characters are numbers' do
    token = TokenGenerator.new.generate(2)

    expect(all_characters_are_numbers?(token)).to be true
  end

  it 'returns a token of 1 digit by default' do
    token = TokenGenerator.new.generate

    expect(token.length).to be 1
  end

  it 'returns nil if 0 given as length' do
    token = TokenGenerator.new.generate(0)

    expect(token).to be nil
  end

  def all_characters_are_numbers?(string)
    string.scan(/\D/).empty?
  end
end