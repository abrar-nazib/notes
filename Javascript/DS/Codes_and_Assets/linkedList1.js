const basket = ["apples", "grapes", "pears"];

//linked list: apples --> grapes --> pears

// apples
// 1111    --> grapes
//             2222    --> pears
//                         3333     --> null

let obj1 = { a: true };
let obj2 = obj1; //obj2 is a reference to the obj1

console.log(obj1);
console.log(obj2);

obj1.a = "yo";

delete obj1;

console.log("1", obj1);
console.log("2", obj2);
