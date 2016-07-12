class DSet
  def initialize(array = [])
    @hash = Hash.new(false)
    array.each { |element| @hash[element] = true }
  end

  def length
    @hash.length
  end

  def add(element)
    @hash[element] = true
  end

end
