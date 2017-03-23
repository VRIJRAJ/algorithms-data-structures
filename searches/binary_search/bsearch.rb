def bsearch(array, target)
  return nil if array.empty?
  return nil if array.length == 1 && target != array.first

  mid = array.length / 2

  return mid if array[mid] == target

  left = array.take(mid)
  right = array.drop(mid)

  if target < array[mid]
    bsearch(left, target)
  elsif target > array[mid]
    search = bsearch(right, target)
    search.nil? ? nil : mid + search
  end
end
