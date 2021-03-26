#include <iostream>

struct Node
{
    int data;
    Node *next;
};

void Insert(int data, int position);
void Print();
void Reverse();
void CreateList();
void RecursivePrint(Node *head);
void RecursiveReversePrint(Node *head);

Node *head = new Node();

int main()
{
    head = NULL;
    CreateList();
    Print();
    RecursivePrint(head);
    //3RecursiveReversePrint(head);
    return 0;
}

void RecursivePrint(Node *start)
{
    if (start == NULL)
    {
        std::cout << "\n"
                  << std::endl;
        return;
    }
    std::cout << start->data << "-"
              << (long)start->next
              << std::endl;

    RecursivePrint(start->next);
}

void RecursiveReversePrint(Node *start)
{

    if (start == NULL)
    {
        std::cout << "\n"
                  << std::endl;
        return;
    }
    RecursiveReversePrint(start->next);
    std::cout << start->data << "-"
              << (long)start->next
              << std::endl;
}

void CreateList()
{
    for (size_t i = 1; i < 10; i++)
    {
        Insert(i, i);
    }
}

void Reverse()
{
    Node *next_addr = head->next;
    head->next = NULL;
    Node *temp2;

    while (1)
    {
        temp2 = next_addr;
        next_addr = temp2->next;
        temp2->next = head;
        head = temp2;
        if (next_addr == NULL)
            break;
    }
}

void Insert(int data, int position)
{

    if (position < 1)
    {
        std::cout << position << " is an Invalid Position!";
        return;
    }
    Node *temp1 = new Node();
    temp1->data = data;
    temp1->next = NULL;
    if (position == 1)
    {
        temp1->next = head;
        head = temp1;
        return;
    }
    Node *temp2 = head;
    for (int i = 1; i < (position - 1); i++)
    {
        temp2 = temp2->next;
    }
    temp1->next = temp2->next; // |x|&y|, |y|&z|, |z|&a|
    temp2->next = temp1;
}

void Print()
{
    Node *temp = head;
    std::cout << "List : \n";
    while (temp != NULL)
    {
        std::cout << temp->data << "-" << (long)temp->next << "\n";
        temp = temp->next;
    }
    std::cout << std::endl;
}