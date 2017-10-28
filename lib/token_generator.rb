class TokenGenerator
  def generate(length=1)
    return nil if length.zero?

    token = ''
    length.times{ token = token + rand(10).to_s }
    token
  end
end