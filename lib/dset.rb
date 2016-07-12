require 'pry'

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

  def include?(element)
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

  def has_subset?(collection)
    collection.each do |element|
      return false unless include? element
    end

    return true
  end

  def in_superset?(collection)
    self.each do |element|
      return false unless collection.include? element
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
