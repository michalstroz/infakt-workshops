class CaesarCipher
  def initialize(str, n=13)
    @str = str
    @n = n
    @miniscules = Array('a'..'z')
    @majuscules = Array('A'..'Z')
  end

  def perform
    @str.chars.map{ |v| maj_min_hash.fetch(v, v) }.join
  end

  private

  def maj_min_hash
    Hash[@miniscules.zip(@miniscules.rotate(@n))].merge(Hash[@majuscules.zip(@majuscules.rotate(@n))])
  end
end
