//const basket = ["apples", "grapes", "pears"];

//linked list: apples --> grapes --> pears

// apples
// 1111    --> grapes
//             2222    --> pears
//                         3333     --> null

// let obj1 = { a: true };
// let obj2 = obj1; //obj2 is a reference to the obj1

// console.log(obj1);
// console.log(obj2);

// obj1.a = "yo";

// delete obj1;

// console.log("1", obj1);
// console.log("2", obj2);

console.log("-----------------------------");
//------Rough Idea of a Linked List-------------
// Linked list to create: 10-->5-->16
// let myLinkedList = {
//   head: {
//     value: 10,
//     next: {
//       value: 5,
//       next: {
//         value: 16,
//         next: null,
//       },
//     },
//   },
// };
class LinkedList1 {
  constructor(value) {
    this.head = { value: value, next: null };
    this.tail = this.head;
    this.length = 1;
  }
  append(value) {
    const node = {
      value: value,
      next: null,
    };
    let travarse = this.head;
    while (travarse.next !== null) {
      travarse = travarse.next;
    }
    travarse.next = node;
    this.tail = node;
    this.length++;
  }
}

const firstList = new LinkedList1(10);
console.log(firstList);
firstList.append(16);
firstList.append(17);
firstList.append(18);
console.log(firstList);

console.log("----------------------------------  ");

class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class LinkedList {
  constructor(value) {
    this.head = new Node(value);
    this.tail = this.head;
    this.length = 1;
  }
  append(value) {
    const newNode = new Node(value);
    this.tail.next = newNode;
    this.tail = newNode;
    this.length++;
    return this;
  }
  prepend(value) {
    const newNode = new Node(value);
    newNode.next = this.head;
    this.head = newNode;
    this.length++;
    return this;
  }

  insert(index, value) {
    // Test parameters
    if (index >= this.length) {
      this.append(value); //just appending to the end of the list if the index is too high
      return;
    }
    if (index <= 0) {
      this.prepend(value);
      return;
    }
    const newNode = new Node(value);
    //   main insert part
    // *-*
    //  *
    const leader = this.traverseToIndex(index - 1);
    // traverse to the index which is pointing to the intended index
    const holdingPointer = leader.next;
    leader.next = newNode;
    newNode.next = holdingPointer;
    return this.printList();
  }

  traverseToIndex(index) {
    //check for params
    let counter = 0;
    let currentNode = this.head;
    while (counter !== index) {
      currentNode = currentNode.next;
      counter++;
    }
    return currentNode;
  }

  printList() {
    const arr = [];
    let currentNode = this.head;
    while (currentNode !== null) {
      arr.push(currentNode.value);
      currentNode = currentNode.next;
    }
    return arr;
  }
  remove(index) {
    // Test the index
    const leaderNode = this.traverseToIndex(index - 1); //O(n)
    // console.log("index-1", leaderIndex.value);
    // console.log("index+1", leaderIndex.next.next.value);
    //leaderIndex.next = leaderIndex.next.next;
    const unwantedNode = leaderNode.next;
    leaderNode.next = unwantedNode.next;
    this.length--;
    return this.printList();
  }

  reverse() {
    //check the condition of the list
    if (!this.head.next) {
      return this.head;
    }
    // Strategy:
    // 1. Take two of the elements
    // 2. Reverse the arrow
    // 3. Move forward to the next two element and repeat from 1 again

    let first = this.head;
    this.tail = this.head;
    let second = first.next;
    while (second) {
      const temp = second.next;
      second.next = first;
      first = second;
      second = temp;
    }
    this.head.next = null; // now the head does not point to anything as it's tail now
    this.head = first;
  }
}

const secondList = new LinkedList(1);
// console.log(secondList);
// secondList.append(2);
// secondList.append(3);
// secondList.append(4);
// secondList.prepend(0);
// //secondList.insert(1, 1000);
// secondList.remove(3);
// console.log(secondList.printList());
// console.log(secondList.reverse1());
secondList.reverse1(0);
