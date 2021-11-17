// const strings = ['a', 'b', 'c', 'd'];
// //4*4 = 16 bytes of storage (if the cpu is 32 bit)

// console.log(strings);
// strings.push('a');
// console.log(strings);
// strings.pop();
// console.log(strings);
// strings.unshift('x');
// console.log(strings);
// //[ 'x', 'a', 'b', 'c', 'd' ]
// strings.splice(2,2,'alien');
// console.log(strings);

class MyArray{
    constructor(){
        this.length = 0;
        this.data = {};
    }

    get(index){
        return this.data[index];
    }

    push(item){
        this.data[this.length] = item;  // add item to the last element of the data
        this.length++;
        return this.length;
    }

    pop(){
        const lastItem = this.data[this.length - 1];
        delete this.data[this.length -1];       // Delete the specified item
        this.length --;
        return lastItem;
    }

    delete(index){
        const item = this.data[index];
        this.shiftItems(index);
        delete this.data[this.length-1];
        this.length--;
        return item;
    }
    
    shiftItems(index){
        for(let i=index; i < this.length - 1; i++){  //O(n) time complexity
            this.data[i] = this.data[i+1];
        }
    }
}

const newArray = new MyArray();
newArray.push('hi');
newArray.push('there');
newArray.push('!');
console.log(newArray);
// console.log(newArray.pop());
// console.log(newArray);
// console.log(newArray.pop());
console.log(newArray.delete(1));
newArray.push('how');
newArray.push('are');
newArray.push('you');
console.log(newArray);
