// Twitter feature: find the first and the latest post of a person
const array = [
    {
        tweet:'hi',
        date: 2012
    },
    {
        tweet:'hello',
        date: 2014
    },
    {
        tweet:'bye',
        date: 2018
    }
];

//have to compare each element's date with all the other ones
//nested loop -> O(n^2)
let firstElement = array[0];    //O(1)
let lastElement = array[array.length - 1];  //O(1)

'helokjwhlarjhslakdfjs;alkjdf'.length //For javascript, O(1) because length is a built in property, not a function.