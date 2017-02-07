# Heap Sort

Heap sort is very stable. Converts array to heap in place. Then extracts in place, leaving a sorted result.

Poor cache usage, because it has to jump around a lot within a potentially large array.

* Always takes O(n log n) time. Unaffected by input order
* When done in place space complexity is constant

* Time: O(n log n)
* Space: O(1)
