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

console.log(quickSort([8, 0, 2, 54, 7, 2, 59, 20, 14]));
// [ 0, 2, 2, 7, 8, 14, 20, 54, 59 ]
