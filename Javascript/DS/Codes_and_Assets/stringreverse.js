// Create a function that reverses a string
// 'Hi! My name is Abrar' sould be:
//'rarbA si eman yM !iH'

//_______________my_solution_________________

// function reverse(str){
//     //console.log(str.split(""));
//     str = str.split("");
//     let len = str.length -1;
//     let newstr = [];
//     str.forEach(function(item){
//         //console.log(item);
//         newstr[len] = item;
//         len--;
//     });
//     return newstr.join("");
// }
// console.log(reverse('Mairala'));

function reverse(str){
    // check input
    if(!str || str.length < 2 || typeof str !== 'string'){
        return 'Invalid input';
    }
    let backwards = [];
    const totalIndex = str.length -1;
    for(let i=totalIndex; i >= 0; i--){
        backwards.push(str[i]);
        //console.log(backwards);
    }
    return backwards.join("");
}

console.log(reverse("mairala"));

function reverse2(str){
    return str.split('').reverse().join('');
}
console.log(reverse2("What the hell"));

const reverse3 = str => str.split('').reverse().join('');

console.log(reverse3("reverse3"));

const reverse4 = str => [...str].reverse().join('');        // Destructure operator
console.log(reverse4("Reversed 4"));