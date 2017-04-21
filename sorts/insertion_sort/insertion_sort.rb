def insertion_sort(array)
  return array if array.length < 2

  array.each_with_index do |el, i|
    next if i == 0

    pos = i - 1
    while pos >= 0 && array[pos] > el
      array[pos + 1] = array[pos]
      pos -= 1
    end

    array[pos + 1] = el
  end

  array
end
