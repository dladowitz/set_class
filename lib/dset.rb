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
    collection.each { |element| add(element) }
  end

  def subset?(collection)
    collection.each do |element|
      unless includes? element
        return false
      end
    end

    return true
  end

  private
  #
  # def merge_array(collection)
  #   collection.each { |element| add(element) }
  # end
  #
  # def merge_dset(collection)
  #   collection.each { |element| add(element) }
  # end
end
