# Heaps

Often used to represent a Priority Queue

Properties:

1. Must be a complete tree
2. Each node must obey heap property

(Min-heap: Each child must be greater than or equal to its parent)

## Methods

### peek

Time Complexity: O(1)

Look at the top-most parent

(Min-heap: Top-most parent is the min)

### insert

Time Complexity: O(log n)

Insert item and swap with parent until heap is valid

### extract

Time Complexity: O(log n)

Swap min and max to remove min, then swap max downwards (always choosing smallest child) until heap is valid again.
