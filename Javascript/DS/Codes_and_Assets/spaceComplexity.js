function boooo(n){
    for( let i = 0; i < n.length; i++){
        console.log('Booo!');
    }
}

boooo([1,2,3,4,5 ])     //O(1)

function arrayOfHiNTimes(n){
    let hiArray = [];       //O(1)
    for( let i = 0; i < n; i++){        //O(n)
        hiArray[i]='Hi';        //each item gets an additional memory space
    }    
    return hiArray;
}

console.log(arrayOfHiNTimes(5));

// The whole function's memory complexity is O(n)