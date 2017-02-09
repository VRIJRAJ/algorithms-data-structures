class QuickSort
  # Not in-place - O(n) memory
  def self.naive(array)
    return array if array.length < 2

    fulcrum = array.shift

    left, right = [], []
    array.each { |el| el <= fulcrum ? left << el : right << el }

    naive(left) + [fulcrum] + naive(right)
  end

  # In-place - O(1) memory
  def self.in_place!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return array if length < 2

    pos = partition(array, start, length, &prc)

    in_place!(array, start, pos - start, &prc)
    in_place!(array, pos + 1, length - pos - 1, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    # Random pivot element to mitigate against pathological datasets
    pos = start + rand(length)
    array[start], array[pos] = array[pos], array[start]

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
