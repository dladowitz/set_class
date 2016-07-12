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

  def includes?(element)
    @hash[element] ? true : false
  end

  def delete(element)
    @hash[element] = false
  end

  def each
    @hash.each { |pair| yield pair[0] }
  end

  def merge(collection)
    if collection.is_a? Array
      merge_array(collection)
    elsif collection.is_a? DSet
      merge_dset(collection)
    else
      puts "Can only merge Arrays and DSets. Maybe put in a feature request."
    end
  end

  private

  def merge_array(collection)
    collection.each { |element| add(element) }
  end

  def merge_dset(collection)
    collection.each { |element| add(element) }
  end
end
