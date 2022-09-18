/*
 * Implementation of queue using fixed size  array
 */

#include <iostream>

class Queue
{
private:
    int front;
    int rear;
    int size;
    int *Q;

public:
    Queue()
    {
        this->front = rear = -1;
        this->size = 10;
        this->Q = new int[this->size];
    }
    Queue(int size)
    {

        this->front = rear = -1;
        this->size = size;
        this->Q = new int[this->size];
    }
    void enqueue(int elem);
    int dequeue();
    void display();
};

void Queue::enqueue(int elem)
{
    if (this->rear == this->size - 1)
    {
        std::cout << "Queue is full. Cannot add any more element." << std::endl;
    }
    else
    {
        this->rear++;
        this->Q[this->rear] = elem;
    }
}

int Queue::dequeue()
{
    int x = -1;
    if (this->rear == this->front)
    {
        std::cout << "Queue is empty. Cannot delete any element." << std::endl;
    }
    else
    {
        x = this->Q[this->front];
        this->front++;
    }
    return x;
}

void Queue::display()
{
    for (int i = this->front + 1; i <= this->rear; i++)
    {
        std::cout << this->Q[i] << std::endl;
    }
}

int main()
{
    Queue q(10);
    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    q.enqueue(4);
    q.enqueue(5);
    q.display();
}