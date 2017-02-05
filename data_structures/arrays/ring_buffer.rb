require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @start_idx = 0
    @capacity = 8
    @store = StaticArray.new(8)
  end

  # O(1)
  def [](index)
    check_index(index)
    store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' unless length > 0

    item = self[length - 1]
    self[length - 1] = nil
    @length -= 1

    item
  end

  # O(1) ammortized
  def push(val)
    resize! if length + 1 > capacity

    @length += 1
    self[length - 1] = val

    val
  end

  # O(1)
  def shift
    raise 'index out of bounds' unless length > 0

    item = self[0]
    self[0] = nil
    @start_idx = (start_idx + 1) % capacity
    @length -= 1

    item
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length + 1 > capacity

    @start_idx = (start_idx - 1) % capacity
    @length += 1

    self[0] = val
  end

  protected

  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' unless index > -1 && index < length
  end

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    (0..length - 1).each { |i| new_store[i] = self[i] }

    @capacity = new_capacity
    @store = new_store
    @start_idx = 0
  end
end