// ------------------Reference type object
var object1 = {value: 10};
var object2 = object1;
var object3 = {value: 10};

console.log(object1);
console.log(object2);
console.log(object3);
console.log(object1 === object2);
console.log(object1 === object3);

object1.value = 15;

console.log(object2.value);
console.log(object3.value);

// ---------------Context type

function b(){
    let a = 4;
}
//console.log(a);   // will throw an error. Because a is out of scope

const object4 = {
    a: function(){
        console.log(this);
    }
}
object4.a();

//------------------------Instantiation

class Player {
    constructor(name, type){
        console.log(`Player: ${this}`);
        this.name = name;
        this.type = type;
    }
    introduce(){
        console.log(`Hi I'm ${this.name} and I'm a ${this.type}`);
    }
}

class Wizard extends Player{
    constructor(name, type){
        super(name, type);
        console.log(`Wizard: ${this}`);
    
    }
    play(){
        console.log(`I'm a ${this.type}`);
    }
}

const wizard1 = new Wizard('Shelly', 'Healer');
const wizard2 = new Wizard('Shawn', 'Dark Magic user');
wizard1.play();
wizard1.introduce();
wizard2.play();
wizard2.introduce();