class CaesarCipher
  def initialize(str, n=13)
    @str = str
    @n = n

  end

  def perform
    @str.chars.map{ |v| maj_min_hash.fetch(v, v) }.join
  end

  private

  def maj_min_hash
    rotate_miniscules = rotate_for(('a'..'z').to_a)
    rotate_majuscules = rotate_for(('A'..'Z').to_a)
    Hash[rotate_miniscules].merge(Hash[rotate_majuscules])
  end

  def rotate_for(data)
    data.zip(data.rotate(@n))
  end
end
