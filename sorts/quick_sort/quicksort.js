// Poor space complexity
// Stable ordering

function quickSort(array) {
  if (array.length <= 1) return array;

  let fulcrum = array.shift();
  const left = [];
  const right = [];

  array.forEach(el => {
    if (el <= fulcrum)
      left.push(el);
    else
      right.push(el);
  });

  let sortedLeft = quickSort(left);
  sortedLeft.push(fulcrum);
  return sortedLeft.concat(quickSort(right));
}
