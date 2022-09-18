#include <iostream>

void log(const char *message)
{
    std::cout << message << std::endl;
}

int main()
{
    log("Hello");
    return 0;
}