//What is the O(n) of function funChallange?

function anotherFunction(){
    console.log('Do Nothing');
}

function funChallange(input){
    let a = 10;         //O(1)
    a = a+50;           //O(1)

    for (let i = 0; i < input.length; i ++){        //O(n)  {Not to count this one}
        anotherFunction();      //O(n)
        let stranger = true;    //O(n)
        a++;        //O(n)
    }
    return a;       //O(1)
}


// Summing the total -> 3 + 4n
// Big O(3+4n)
// Simplified: O(n)

// What is the Big O of the below function? (Hint, you may want to go line by line)
function anotherFunChallenge(input) {
    let a = 5;      //O(1)
    let b = 10;     //O(1)
    let c = 50;     //O(1)
    for (let i = 0; i < input; i++) {   //O(n)  {Not to count this one}
      let x = i + 1;    //O(n)
      let y = i + 2;    //O(n)
      let z = i + 3;    //O(n)
  
    }
    for (let j = 0; j < input; j++) {   //O(n)  {Not to count this one}
      let p = j * 2;    //O(n)
      let q = j * 2;    //O(n)
    }
    let whoAmI = "I don't know";    //O(1)
  }

  //Big O(4+5n)
  //Simplified: O(n)

// What is the Big O Notation of the below Function?

function printFirstItemThenFirstHalfThenSayHi100Times(items) {
    console.log(items[0]);      //O(1)

    var middleIndex = Math.floor(items.length / 2);
            //Floor is used for getting a whole number
    var index = 0;

    while (index < middleIndex) {       //O(n/2)
        console.log(items[index]);
        index++;
    }

    for (var i = 0; i < 100; i++) {     //O(100)
        console.log('hi');
    }
}

//Overall Big O(1+n/2+100)
//Simplified: O(n)      //as n gets larger and larger, n/2 loses it's significance