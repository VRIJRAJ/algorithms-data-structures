# This class just dumbs down a regular Array to be staticly sized.
class StaticArray
  def initialize(length)
    @length = length
    @store = Array.new(length)
  end

  # O(1)
  def [](index)
    raise 'outside bounds' unless index > -1 && index < @length
    store[index]
  end

  # O(1)
  def []=(index, value)
    raise 'outside bounds' unless index > -1 && index < @length
    store[index] = value
  end

  protected

  attr_accessor :store
end
