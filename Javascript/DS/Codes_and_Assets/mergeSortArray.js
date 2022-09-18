// expected output [0,3,4,4,6,30,31]
const a = [0, 3, 4, 31, 36, 39, 42, 45, 90];
const b = [4, 6, 30, 33, 36, 40, 43, 45, 48, 57, 59];

// find out which one's first element is the smallest -> baseArray
// reverse the other one -> compareArray
// compare with two elements

//--------------------------------------------------------------
// function mergeSortedArray(arr1, arr2) {
//   let baseArray = arr1[0] > arr2[0] ? arr2 : arr1;
//   let compareArray = (arr1[0] < arr2[0] ? arr2 : arr1).reverse();
//   for (j = 0; j < baseArray.length; j++) {
//     if (
//       baseArray[j] <= compareArray[compareArray.length - 1] &&
//       baseArray[j + 1] >= compareArray[compareArray.length - 1]
//     ) {
//       baseArray.splice(j + 1, 0, compareArray.pop());
//     }
//   }
//   if (!compareArray) {
//     return baseArray;
//   }
//   compareArray.reverse().forEach(function (element) {
//     baseArray.push(element);
//   });
//   return baseArray;
// }

function mergeSortedArray(array1, array2) {
  const mergedArray = [];
  let array1Item = array1[0];
  let array2Item = array2[0];
  let i = 1;
  let j = 1;
  //check input
  if (array2.length === 0) {
    return array1;
  }
  if (array1.length === 0) {
    return array2;
  }
  while (array1Item || array2Item) {
    console.log(`${array1Item}, ${array2Item}`);
    if (!array2Item || array1Item < array2Item) {
      mergedArray.push(array1Item);
      array1Item = array1[i];
      i++;
    } else {
      mergedArray.push(array2Item);
      array2Item = array2[j];
      j++;
    }
  }
  return mergedArray;
}

console.log(mergeSortedArray(a, b));
