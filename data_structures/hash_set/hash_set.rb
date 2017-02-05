require_relative 'hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if count == num_buckets
      self[key] << key
      @count += 1
    end
  end

  def remove(key)
    self[key].delete(key)
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    items = @store.reduce { |accum, bucket| accum + bucket }
    initialize(num_buckets * 2)
    items.each { |item| insert(item) }
  end
end
