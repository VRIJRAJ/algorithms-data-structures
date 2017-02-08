class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2

    fulcrum = array.shift

    left, right = [], []
    array.each { |el| el <= fulcrum ? left << el : right << el }

    sort1(left) + [fulcrum] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return array if length < 2

    pos = partition(array, start, length, &prc)

    sort2!(array, start, pos - start, &prc)
    sort2!(array, pos + 1, length - pos - 1, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    pos = start
    el = array[start]

    ((start + 1)...(start + length)).each do |j|
      if prc.call(el, array[j]) > 0
        array[j], array[pos + 1] = array[pos + 1], array[j]
        pos += 1
      end
    end

    array[start], array[pos] = array[pos], array[start]
    pos
  end
end
