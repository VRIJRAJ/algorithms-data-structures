# Quick Sort

Selects a pivot, shuffles items to left and right of pivot according to sort, then recursively sorts the left and right sections. Fast for best and average case time complexity, but slow for worst case. Choose pivot randomly to mitigate against pathological datasets.

Can be done in place, but since it's called recursively space complexity is dependent on the number of calls made.

**Best and Average Case**
* Time: O(n log n)
* Space: O(log n)

**Worst Case**
* Time: O(n^2)
* Space: O(n)
