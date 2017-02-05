require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(8)
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[index] = val
    @length += 1
    val
  end

  # O(1)
  def pop
    raise 'index out of bounds' unless length > 0
    item = store[length - 1]
    store[length - 1] = nil
    @length -= 1
    item
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length + 1 > capacity

    store[length] = val
    @length += 1
    val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' unless length > 0
    item = store[0]

    (1..length - 1).each do |i|
      store[i - 1] = store[i]
    end

    @length -= 1
    item
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length + 1 > capacity

    @length += 1
    i = length - 1
    while i >= 0
      store[i + 1] = store[i]
      i -= 1
    end

    store[0] = val
  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' unless index > -1 && index < length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = capacity * 2
    new_store = StaticArray.new(capacity)
    (0..length - 1).each { |i| new_store[i] = store[i] }
    @store = new_store
  end
end
