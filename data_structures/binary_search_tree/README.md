# Binary Search Trees

## Unbalanced

In a binary search tree a node is always bigger than everything to its left, and always smaller than everything to its right (or equal to for left or right depending on how it's set up).

\#find:   O(n)
\#insert: O(n)
\#delete: O(n)

### Find

Look at a node, and if the element is smaller look to the left. If the element is bigger look to the right.

### Insert

Search down the tree in the same manner that find does until you find an empty place to append the new element.

### Delete

**Hibbard Deletion**
(Maintains O(n**0.5))
Find the node to delete. If it doesn't have any children just delete it. If it does have children find the largest node to the deleted node's left (the node that will be bigger than everything to the deleted node's left and smaller than everything to the deleted node's right), and place it in the deleted node's position.

Can also be done by using the smallest node to the right as the replacement node.

## Balanced

* Difference in depth of left and right branches <= 1
* Both left and right branches are balanced

\#find:   O(log n)
\#insert: O(log n)
\#delete: O(log n)
