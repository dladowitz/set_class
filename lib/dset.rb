require 'pry'

class DSet
  def initialize(array = [])
    @hash = Hash.new(false)
    self.merge(array)
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
    is_subset_of(collection, self)
  end

  def in_superset?(collection)
    is_subset_of(self, collection)
  end

  private

  def is_subset_of(subset, superset)
    subset.each do |element|
      return false unless superset.include? element
    end

    return true
  end
  #
  # def merge_array(collection)
  #   collection.each { |element| add(element) }
  # end
  #
  # def merge_dset(collection)
  #   collection.each { |element| add(element) }
  # end
end
