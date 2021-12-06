class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }
  peek() {
    // look at the top of the stack
    return this.head;
  }
  push(value) {
    const newNode = new Node(value);
    if (this.isEmpty()) {
      this.top = newNode;
      this.bottom = newNode;
    } else {
      const holdingPointer = this.top;
      this.top = newNode;
      this.top.next = holdingPointer;
    }
    this.length++;
  }
  pop() {
    if (this.isEmpty()) {
      return null;
    }
    if (this.top === this.bottom) {
      this.bottom = null;
    }
    const holdingPointer = this.top;
    this.top = this.top.next;
    this.length--;
    return holdingPointer;
  }
  isEmpty() {
    if (this.length === 0) return true;
  }
  printStack() {
    let stackObj = this.top;
    while (stackObj !== null) {
      console.log(
        `value: ${stackObj.value}, next: ${
          stackObj.next !== null ? stackObj.next.value : stackObj.next
        }`
      );
      stackObj = stackObj.next;
    }
  }
}

const myStack = new Stack();
myStack.push("google");
myStack.push("discord");
myStack.push("udemy");

myStack.printStack();

//discord
//udemy
//google
