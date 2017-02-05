require_relative '../hash_map/hash_map'
require_relative '../linked_list/linked_list'

# LRU Cache that creates values for keys by running them through a proc
class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map.get(key))
    else
      eject! if count == @max
      calc!(key)
    end

    @map.get(key).val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    @store.insert(key, val)
    @map.set(key, @store.last)
  end

  def update_link!(link)
    link.remove
    @store.insert(link.key, link.val)
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
