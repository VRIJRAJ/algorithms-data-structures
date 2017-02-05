// # Choose pivot randomly to mitigate against pathological datasets
// # Sort in place for better space complexity
// # Unstable ordering

function quickSortInPlace(array, start = 0, length = array.length) {
  // Base case: return when section is one or less items
  if (length < 2) return array;

  // Randomly choose a pivot
  let pos = start + Math.floor(Math.random() * length);
  let pivot = array[pos];

  // Move pivot to beginning of array and reset pos
  [array[start], array[pos]] = [array[pos], array[start]];
  pos = start;

  for (let i = pos + 1; i < start + length; i++) {
    let el = array[i];
    if (el < pivot) {
      // Move element right of pivot to current index
      array[i] = array[pos + 1];
      // Move pivot right of pos
      array[pos + 1] = pivot;
      // Move el left of pivot
      array[pos] = el;

      // Move pivot index
      pos += 1;
    }
  }

  // Sort sections left and right of pivot
  let leftLength = pos - start;
  let rightLength = length - (leftLength + 1);
  quickSortInPlace(array, start, leftLength);
  quickSortInPlace(array, pos + 1, rightLength);

  return array;
}
