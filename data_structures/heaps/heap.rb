class Heap
  def initialize(val = nil, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    @prc = prc
    @store = val ? [val] : []
  end

  def push(val)
    @store << val
    heapify_up!
  end

  def peek
    raise "Heap empty" if count == 0
    @store.first
  end

  def poll
    raise "Heap empty" if count == 0

    el = @store.first
    @store[0] = @store.last
    @store.pop
    heapify_down!

    el
  end

  def store
    @store
  end

  private

  def heapify_up!
    index = count - 1
    # while has_parent(index) && parent(index) > @store[index]
    while has_parent(index) && @prc.call(parent(index), @store[index]) >= 0
      parent_index = parent_index(index)

      @store[index], @store[parent_index] = @store[parent_index], @store[index]
      index = parent_index
    end
  end

  def heapify_down!
    index = 0
    while has_left_child(index)
      li, ri = left_child_index(index), right_child_index(index)
      if @store[ri].nil?
        child_i = li
      else
        # child_i = @store[li] < @store[ri] ? li : ri
        child_i = @prc.call(@store[li], @store[ri]) < 0 ? li : ri
      end

      # if @store[index] < @store[child_i]
      if @prc.call(@store[index], @store[child_i]) < 0
        return :ok
      else
        @store[index], @store[child_i] = @store[child_i], @store[index]
      end

      index = child_i
    end
  end

  def count
    @store.length
  end

  def left_child(index)
    @store[left_child_index(index)]
  end

  def right_child(index)
    @store[right_child_index(index)]
  end

  def parent(index)
    @store[parent_index(index)]
  end

  def left_child_index(parent_index)
    parent_index * 2 + 1
  end

  def right_child_index(parent_index)
    parent_index * 2 + 2
  end

  def parent_index(child_index)
    (child_index - 1) / 2
  end

  def has_left_child(index)
    left_child_index(index) < count
  end

  def has_right_child(index)
    right_child_index(index) < count
  end

  def has_parent(index)
    parent_index(index) >= 0
  end
end
