require '../../data_structures/heaps/heap'

class Array
  # Time: O(n log n)
  # Space: O(n)
  # def heap_sort!
  #   heap = BinaryMinHeap.new
  #
  #   self.count.times { heap.push(self.pop) }
  #   heap.count.times { self << heap.extract }
  #
  #   self
  # end

  # Time: O(n log n)
  # Space: In place
  def heap_sort!
    max = Proc.new { |x, y| y <=> x }

    (2..count).each do |size|
      BinaryMinHeap.heapify_up(self, size - 1, size, &max)
    end

    count.downto(2).each do |size|
      self[size - 1], self[0] = self[0], self[size - 1]
      BinaryMinHeap.heapify_down(self, 0, size - 1, &max)
    end

    self
  end
end
