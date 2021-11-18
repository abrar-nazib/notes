console.log("-------------------------------------------");
// let user = {
//   age: 54,
//   name: "Kylie",
//   magic: true,
//   scream: function () {
//     console.log("Aaaaaahhhhhhh!");
//   },
// };
// console.log(user.age);
// user.spell = "Abra kaDabra";
// user.scream();  //O(1)

// ----------------------------------
//         IMPLEMENTING HASH TABLE

//      MY SOLUTION

// class HashTable {
//   constructor(size) {
//     this.data = new Array(size);
//   }

//   _hash(key) {
//     let hash = 0;
//     for (let i = 0; i < key.length; i++) {
//       hash = (hash + key.charCodeAt(i) * i) % this.data.length;
//     }
//     return hash;
//   }
//   get(key) {
//     //console.log(`Key: ${key}`);
//     return this.data[this._hash(key)][1];
//   }
//   set(key, value) {
//     if (!this.data[this._hash(key)]) this.data[this._hash(key)] = [key, value];
//     else {
//       console.log("Need to apply a ninja technique");
//     }
//   }
// }

// const myHashTable = new HashTable(50);
// myHashTable.set("grapes", 10000);
// myHashTable.set("banana", 200);
// console.log(myHashTable.get("grapes"));
// myHashTable.set("banana", 500);
// console.log(myHashTable.data);

//-------------------------------------------

//      COURSE SOLUTION

class HashTable {
  constructor(size) {
    this.data = new Array(size); // fixed size memory
  }

  _hash(key) {
    // I want this method to be private. But ES6 won't let me to do so
    let hashedIndex = 0;
    for (let i = 0; i < key.length; i++) {
      hashedIndex = (hashedIndex + key.charCodeAt(i) * i) % this.data.length;
    }
    return hashedIndex;
  }

  get(key) {
    let address = this._hash(key);
    const currentBucket = this.data[address];
    if (currentBucket) {
      for (let i = 0; i < currentBucket.length; i++) {
        if (currentBucket[i][0] === key) {
          return currentBucket[i][1];
        }
      }
    }
    return undefined;
  }

  set(key, value) {
    //console.log(`${key} ${value}`);
    let address = this._hash(key);
    if (!this.data[address]) {
      this.data[address] = []; //if nothing's already there, create an empty array
    }
    this.data[address].push([key, value]);
    return this.data;
  }
}

const myHashTable = new HashTable(5);
//console.log(myHashTable._hash(""));
console.log(myHashTable.set("grapes", 10));
console.log(myHashTable.set("mangoes", 20));
console.log(myHashTable.set("apples", 30));
console.log(myHashTable.set("coconuts", 40));
console.log(myHashTable.set("bananas", 50));
console.log(myHashTable.set("lichi", 60));
console.log(myHashTable.set("olives", 70));
console.log("-------------------------");
console.log(myHashTable.get("grapes"));
console.log(myHashTable.get("mangoes"));
console.log(myHashTable.get("apples"));
console.log(myHashTable.get("bananas"));
console.log(myHashTable.get("coconuts"));
console.log(myHashTable.get("lichi"));
console.log(myHashTable.get("olives"));
