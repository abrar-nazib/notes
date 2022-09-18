// Google Question : Tell me the first recurring character
/* Given an*/ const testarray = [2, 5, 1, 2, 3, 5, 1, 2, 4];
// It should return 2

// Given an
const testarray2 = [2, 1, 1, 2, 3, 5, 1, 2, 4];
// It should return 1

// Given an
const testarray3 = [2, 3, 4, 5];
// It should return undefined

//----------------MySolution-------------------
// function findFirstRecurringElement(inpArr) {
//   const storageObject = {};
//   for (let i = 0; i < inpArr.length; i++) {
//     if (storageObject[inpArr[i]] === true) {
//       return inpArr[i];
//     }
//     storageObject[inpArr[i]] = true;
//   }
//   return undefined;
// }

// console.log(findFirstRecurringElement(testarray3));

//-------------------------CourseSolution

function firstRecurringCharacter(input) {
  for (let i = 0; i < input.length; i++) {
    for (let j = i + 1; j < input.length; j++) {
      if (input[i] === input[j]) {
        return input[i];
      }
    }
  }
  return undefined;
} //O(n^2) time complexity
// O(1) space complexity

console.log(firstRecurringCharacter(testarray));

function firstRecurringCharacter2(input) {
  let map = {}; // Because of this, O(n) memory complexity is created
  for (let i = 0; i < input.length; i++) {
    if (map[input[i]]) {
      return input[i];
    } else {
      map[input[i]] = i;
    }
  }
  console.log(map);
  return undefined;
}
console.log(firstRecurringCharacter2(testarray));
