#include <stdio.h>
extern int my_asm(int a, int b);
int main(int argc, char *argv[])
{
    int r = my_asm(20, 40);
    printf("Value is %i", r);
    return 0;
}