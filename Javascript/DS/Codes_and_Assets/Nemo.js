const {performance} = require('perf_hooks');

const nemo = ['nemo'];
const everyone = ['dory', 'bruce', 'marlin', 'gill', 'bloat', 'nigel', 'squirt', 'darla', 'hank', 'nemo'];
const large = new Array(100000).fill('nemo');

function findNemo(array){
  let t0 = performance.now();
  for(let i = 0; i< array.length; i++){
    if(array[i] === 'nemo'){
      console.log('Found NEMO!');
    }
  }
  let t1 = performance.now();
  console.log("Call to find Nemo took " + (t1-t0) + " milliseconds");
}

//findNemo(large);


////--------- ES6 Syntax -----------------------------

const findNemo2 = (arr) => {
  arr.forEach((fish) => {
    if(fish === 'nemo'){
      console.log('Found Nemo');
    }
  });
}

findNemo2(everyone);


const findNemo3 = (arr) => {
  for(let fish of arr){
  if(fish === 'nemo'){
      console.log('Found Nemo');
    }
  }
}

findNemo3(everyone);