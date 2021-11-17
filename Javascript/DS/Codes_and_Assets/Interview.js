//Given two arrays. create a function that lets a user know (true/false) whether these two arrays contain any common items
//For example:
//const array1 = ['a', 'b', 'c', 'x'];
//const array2 = ['z', 'y', 'i'];
//should return false
//------------------
//const array1 = ['a', 'b', 'c', 'x'];
//const array2 = ['z', 'y', 'i', 'x'];
//should return true.

//-------------------------

// 2 parameters - arrays - no size limit
// return true/false

//First naive approach:
//  Nested loop -> O(n^2)
// Space complexity -> O(1)

const array1 = ['a', 'b', 'c', 'x'];
const array2 = ['z', 'y', 'i', 'x'];
    // function containsCommonItem(arr1, arr2){
    //     for (let i=0; i<arr1.length; i++){
    //         for(let j = 0; j < arr2.length; j++){
    //             if(arr1[i] === arr2[j]){
    //                 return true;  
    //             }
    //         }
    //     }
    //     return false;
    // }
    // // Time Complexity: O(a*b)
    // // Space Complexity: O(a)

    // console.log(containsCommonItem(array1, array2));

// array1 ==> obj{
//  a: true,
//  b: true,
//  c: true,
//  x: true
//}

//array2[index] === obj.properties

function containsCommonItems2(arr1, arr2){
    // loop through first array and create object where properties === items in the array
    let map = {};
    for (let i=0; i<arr1.length; i++){
        if(!map[arr1[i]]){
            const item = array1[i];
            map[item] = true;
        }
     }
    //console.log(map);

    // loop through second array and check if item in second array exits in the created object
     for (let j = 0; j < array2.length; j++){
         if(map[arr2[j]]){
             return true;
         }
     }
     return false;

}

console.log(containsCommonItems2(array1, array2));

//O(a+b)

function containsCommonItems3(arr1, arr2){
    return arr1.some((item) => arr2.includes(item));
}