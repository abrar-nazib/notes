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
    const backwards = [];

    const totalIndex = str.length -1;
    for(let i=totalItems; i = 0; i--){
        backwards.push(str[i]);
    }
    return backwards.join("");
}

console.log(reverse("mairala"));