class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    store.count
  end

  def extract
    raise 'heap empty, cannot extract' if count < 1
    @store[0], @store[-1] = @store[-1], @store[0]

    item = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &prc) if count > 1

    item
  end

  def peek
    store.first
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1, @prc)
  end

  def self.child_indices(len, parent_index)
    [2 * parent_index + 1, 2 * parent_index + 2].select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    left_i, right_i = child_indices(len, parent_idx)

    children = []
    children << array[left_i] unless left_i.nil?
    children << array[right_i] unless right_i.nil?

    if children.all? { |child| prc.call(array[parent_idx], child) <= 0 }
      return array
    end

    swap_i = nil
    if children.length == 1
      swap_i = left_i
    else
      swap_i = prc.call(children[0], children[1]) == -1 ? left_i : right_i
    end

    array[parent_idx], array[swap_i] = array[swap_i], array[parent_idx]
    heapify_down(array, swap_i, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    if prc.call(array[child_idx], array[parent_idx]) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      heapify_up(array, parent_idx, len, &prc)
    end
  end

  protected

  attr_accessor :prc, :store
end
