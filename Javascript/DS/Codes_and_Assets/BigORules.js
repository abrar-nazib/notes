function compressBoxesTwice(boxes, boxes2){
    boxes.forEach(function(boxes){
        console.log(boxes);
    });
    
    boxes2.forEach(function(boxes){
        console.log(boxes); 
    });
}

//As the function depends on 2 seperate inputs,
// and each input creates it's own O(n) time complexity,
//the time complexity will be O(a+b) -> a for the first parameter, b for the second


//----------------------------------

//Log all pairs of array

const boxes = ['a', 'b', 'c', 'd', 'e'];
function logAllPairsOfArray(array) {
  for (let i = 0; i < array.length; i++) {
    for (let j = 0; j < array.length; j++) {
      console.log(array[i], array[j])
    }
  }
}

//logAllPairsOfArray(boxes)

// For loops one after another: we use + between them
// For loops one inside another: we use * between them

//This function's O(n) is O(n*n)
//Simplified: O(n^2)

function printAllNumbersThenAllPairSums(numbers){
    console.log('These are the numbers: ');
    
    numbers.forEach(function(number){       //this loop's O(n)
        console.log(number);
    });          

    console.log('And these are their sums: ');
    
    numbers.forEach(function(firstNumber){      //this loop's O(n*n) -> O(n^2)
        numbers.forEach(function(secondNumber){
            console.log(firstNumber + secondNumber);
        });
        //console.log("Done for " + firstNumber);
    });
}

printAllNumbersThenAllPairSums([1,2,3]);

//the whole time complexity of the function will be O(n^2) -> for rule number 4.