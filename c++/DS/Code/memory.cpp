#include <iostream>
const int memoryLength = 10;
int memoryArray[memoryLength];

struct Memory
{
    int position;
    int size;
    int *arr;
};

void createMemory(struct Memory *m)
{
    m->size = memoryLength;
    m->position = 0;
    m->arr = memoryArray;
    for (int i = 0; i < m->size; i++)
    {
        m->arr[i] = 0;
    }
}
void showMemory(struct Memory *m)
{
    for (int i = 0; i < m->size; i++)
    {
        std::cout << i << "->" << (m->position) % m->size << "->" << m->arr[i] << std::endl;
    }
}
void showMemory2(struct Memory *m)
{
    for (int i = m->position + 1; i <= m->size + m->position; i++)
    {
        std::cout << i << "->" << i % m->size << "->" << m->arr[i % m->size] << std::endl;
    }
}

void addReading(struct Memory *m, int reading)
{
    m->position = (m->position + 1) % m->size;
    m->arr[m->position] = reading;
}

int main()
{
    Memory sensorMemory;
    createMemory(&sensorMemory);
    for (int i = 0; i < 15; i++)
    {
        addReading(&sensorMemory, i * 10);
    }
    showMemory(&sensorMemory);
    std::cout << "-------" << std::endl;
    showMemory2(&sensorMemory);
    return 0;
}