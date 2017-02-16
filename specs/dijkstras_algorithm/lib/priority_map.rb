require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    @map = {}
    @queue = BinaryMinHeap.new do |x, y|
      prc.call(@map[x], @map[y])
    end
  end

  def [](key)
    return nil unless @map.key?(key)
    @map[key]
  end

  def []=(key, value)
    if @map.key?(key)
      update(key, value)
    else
      insert(key, value)
    end
  end

  def count
    @map.count
  end

  def empty?
    count.zero?
  end

  def extract
    key = @queue.extract
    value = @map.delete(key)

    [key, value]
  end

  def has_key?(key)
    @map.key?(key)
  end

  protected
  
  attr_accessor :map, :queue

  def insert(key, value)
    @map[key] = value
    @queue.push(key)
  end

  def update(key, value)
    @map[key] = value
    @queue.reduce!(key)
  end
end
