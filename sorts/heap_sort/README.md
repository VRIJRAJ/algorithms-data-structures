# Heap Sort

Converts array to heap in place. Then extracts in place, leaving a sorted result.

Heap sort is very stable. Always takes O(n log n) time (no pathological datasets). When done in place space complexity is constant. Stable Ordering.

Poor cache usage, because it has to jump around a lot within a potentially large array.

* Time: O(n log n)
* Space: O(1)
